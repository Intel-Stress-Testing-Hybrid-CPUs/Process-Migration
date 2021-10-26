#
#Script for running a process and changing the running core of the process while running


#replace app.exe with actual application name
$app_name = "app.exe"
$app_arguments = "arg0"

$pinfo = New-Object System.Diagnostics.ProcessStartInfo
$pinfo.FileName = $app_name
$pinfo.Arguments = $app_arguments
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
$p.Start()
$p.ProcessorAffinity=0x3