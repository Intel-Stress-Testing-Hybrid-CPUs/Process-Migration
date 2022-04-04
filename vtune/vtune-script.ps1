#Powershell script to launch Intel VTune CLI and perform uarch-exploration on an application
# NOTE: must be run as administrator!


# set to the path of your VTune installation
$vtune_path = "C:\Program Files (x86)\Intel\oneAPI\vtune\2022.1.0"

# path to vtune-vars.bat ; must be run before vtune will work
$vars_path = Join-Path $vtune_path "vtune-vars.bat"

# path of app to test
#$app_path = "C:\Program Files (x86)\Notepad++\notepad++.exe"
$app_path = ".\prime95\prime95.exe"

# command for uarch-exploration
$vtune_cmd = "vtune -collect uarch-exploration -- `"$app_path`""

# get timestamp for output file
$timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }

# command to generate report to file
$vtune_report = "vtune -report hw-events -report-output ./results/$timestamp.txt"

# setup environment vars, launch uarch-exploration, generate report
cmd.exe /k "`"$vars_path`"&&$vtune_cmd&&$vtune_report" 
