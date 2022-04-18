#Powershell script to launch Intel VTune CLI and perform uarch-exploration on an application
# NOTE: must be run as administrator!


# set to the path of your VTune installation
$vtune_path = "C:\Program Files (x86)\Intel\oneAPI\vtune\2022.1.0"

# path to vtune-vars.bat ; must be run before vtune will work
$vars_path = Join-Path $vtune_path "vtune-vars.bat"

# read arguments from cfg file
Get-Content ".\cfg-vtune.txt" | ForEach-Object -Begin {$settings=@{}} -Process {$store = [regex]::split($_,'='); if(($store[0].CompareTo("") -ne 0) -and ($store[0].StartsWith("[") -ne $True) -and ($store[0].StartsWith("#") -ne $True)) {$settings.Add($store[0], $store[1])}}
# read path of app to test from cfg file
$app_path = $settings.Get_Item("test_path")
# analysis mode for VTune to run in
$analysis_mode = $settings.Get_Item("analysis_mode")

# command for analysis mode to be run
$vtune_cmd = "vtune -collect $analysis_mode -- $app_path"

# get timestamp for output file
$timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }

# command to generate report to file
$vtune_report = "vtune -report hw-events -report-width 60 -report-output ./vtune_output/$timestamp.txt"

# launch Coreinfo, with output redirected to a file
.\Coreinfo\Coreinfo64.exe *> .\coreinfo_output\$timestamp-coreinfo.txt

# launch process migration script
Start-Process powershell {.\process-migrate-script-vtune.ps1}

# setup environment vars, launch uarch-exploration
cmd.exe /k "`"$vars_path`" && $vtune_cmd & exit"

# generate report once collection has finished
cmd.exe /k "`"$vars_path`" && $vtune_report"