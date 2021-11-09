#process-migrate-simple.ps1
#Powershell script for starting a process and changing the running core of the process


#replace app.exe with actual application name
$app_name = "C:\Program Files (x86)\Notepad++\notepad++.exe"
#$app_arguments = "arg0"

#Create start info for Process Object
$pinfo = New-Object System.Diagnostics.ProcessStartInfo
$pinfo.FileName = $app_name
#$pinfo.Arguments = $app_arguments

#Create Process Object to be run
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
#Start the process
$p.Start()

#Set processor affinity bitmap to 0100
$p.ProcessorAffinity=0x4