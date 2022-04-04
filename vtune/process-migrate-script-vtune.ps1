#process-migrate-script.ps1
#version 2.0
#Powershell script for starting a process and changing the running core of the process

#Create process to be run that the logging executable will attach itself to when given the PID
# $app_name = "C:\Program Files (x86)\Notepad++\notepad++.exe"

# $pinfo = New-Object System.Diagnostics.ProcessStartInfo 
# $pinfo.FileName = $app_name
# $p = New-Object System.Diagnostics.Process
# $p.StartInfo = $pinfo
# $p.Start()

#Wait until prime95 has been started by VTune script
Start-Sleep -s 5

#Either hardcode the process name (prime95), or receive from vtune-script
#Uses Get-Process cmdlet which gets a process object given the name or PID of a running process
$p = Get-Process prime95

#Get the PID of the new process
$procid  =  get-process $p.ProcessName |select -expand id
echo "Process ID:" $procid

#set path to logging executable relative to this script
$cpp_name = Join-Path $PSScriptRoot "logger-vtune.exe"
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

#Set processor affinity mask to a single core for baseline homogeneous testing
$p.ProcessorAffinity=0x1

# either have this script terminate prime95 after some period of time, or we must manually kill


#Terminate running process, which should also end the logging executable
Start-Sleep -s 15
$p.Kill()