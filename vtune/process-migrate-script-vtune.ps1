#process-migrate-script.ps1
#Powershell script for starting a process and changing the running core of the process

# read arguments from cfg file
Get-Content ".\cfg-process-migrate.txt" | ForEach-Object -Begin {$settings=@{}} -Process {$store = [regex]::split($_,'='); if(($store[0].CompareTo("") -ne 0) -and ($store[0].StartsWith("[") -ne $True) -and ($store[0].StartsWith("#") -ne $True)) {$settings.Add($store[0], $store[1])}}
# timeout period, in seconds
$timeout = $settings.Get_Item("timeout")
# name of application to test
$target_app = $settings.Get_Item("target_app")
# desired mode of process migration
$migration_mode = $settings.Get_Item("migration_mode")
# testing period in seconds, after which the test app is killed
$testing_duration = $settings.Get_Item("testing_duration")

# start stopwatch, to timeout if the test app is not found
$stopwatch = [System.Diagnostics.Stopwatch]::new()
$stopwatch.Start()

while($stopwatch.Elapsed.Seconds -lt $timeout){
    $p = Get-Process $target_app -ErrorAction SilentlyContinue
    if($p) {
        # test app started, wait for launching to finish
        Start-Sleep -s 2
        # reacquire the process handle (because the original process may be recycled)
        $p = Get-Process $target_app
        break
    }
}
# if timeout elapses, try one last time without suppressing errors
if(!$p){
    #Uses Get-Process cmdlet which gets a process object given the name or PID of a running process
    $p = Get-Process $target_app
}

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

if($migration_mode -eq "single"){
    #Set processor affinity mask to a single core for baseline homogeneous testing
    $p.ProcessorAffinity=0x1
} elseif($migration_mode -eq "bounce"){
    #Set processor affinity mask to bounce between two cores

} elseif($migration_mode -eq "rotation"){
    #Set processor affinity mask to rotate between all cores

}

# if testing_duration is positive, Terminate running process, which should also end the logging executable
if($testing_duration -gt 0){
    Start-Sleep -s $testing_duration
    $p.Kill()
}