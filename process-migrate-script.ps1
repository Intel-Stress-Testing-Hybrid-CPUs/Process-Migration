#process-migrate-script.ps1
#version 2.0
#Powershell script for starting a process and changing the running core of the process

#Create process to be run that the logging executable will attach itself to when given the PID
$app_name = "C:\Program Files (x86)\Notepad++\notepad++.exe"

$pinfo = New-Object System.Diagnostics.ProcessStartInfo 
$pinfo.FileName = $app_name
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
$p.Start()

#Get the PID of the new process
$procid  =  get-process $p.ProcessName |select -expand id
echo "Process ID:" $procid

#set path to logging executable relative to this script
$cpp_name = Join-Path $PSScriptRoot "logger.exe"
$cpp_arguments = $procid

#Create start info for Process Object
$loginfo = New-Object System.Diagnostics.ProcessStartInfo 
$loginfo.FileName = $cpp_name
#Give PID of new process to the logging executable
$loginfo.Arguments = $cpp_arguments

#Create Process Object to be run
$logger = New-Object System.Diagnostics.Process
$logger.StartInfo = $loginfo
#Start the process
$logger.Start()

#Wait until logging executable has begun to proceed
Start-Sleep -m 50

#Rotate processor affinity mask from 0001 to 1000 and back to 0001
$p.ProcessorAffinity=0x1
Start-Sleep -m 50
$p.ProcessorAffinity=0x2
Start-Sleep -m 50
$p.ProcessorAffinity=0x4
Start-Sleep -m 50
$p.ProcessorAffinity=0x8
Start-Sleep -m 50

#Terminate ruinning process, which should also end the logging executable
$p.Kill()