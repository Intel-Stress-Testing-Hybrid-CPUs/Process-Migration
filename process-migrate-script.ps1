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

#Replace this executable pathname with your own path to logging executable
$cpp_name = "C:\Users\nickt\Documents\UT\Intel-Stress-Testing-Hybrid-CPUs\Process-Migration\logger.exe"
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

#Set processor affinity bitmap to 0100
#$p.ProcessorAffinity=0x4