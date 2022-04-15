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
# testing period in seconds, after which the test app is killed; set <= 0 to run indefinitely
$testing_duration = $settings.Get_Item("testing_duration")
# period in seconds to sleep between migrations
$migration_sleep_period = $settings.Get_Item("migration_sleep_period")

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

# if testing_duration is positive, migrate for testing_duration,
#   then terminate running process, which should also end the logging executable
if($testing_duration -gt 0){
    # start stopwatch, to migrate for testing_duration
    $stopwatch = [System.Diagnostics.Stopwatch]::new()
    $stopwatch.Start()

    while($stopwatch.Elapsed.Seconds -lt $testing_duration){
        if($p.HasExited){
            # test process has terminated, so kill the logger and exit
            $logger.Kill()
            exit
        }
        if($migration_mode -eq "none"){
            # leave processor affinity mask alone
        } elseif($migration_mode -eq "single"){
            #Set processor affinity mask to a single core for baseline homogeneous testing
            $p.ProcessorAffinity=0x1
        } elseif($migration_mode -eq "bounce"){
            #Set processor affinity mask to bounce between two cores
            if($p.ProcessorAffinity -eq 0x1){
                $p.ProcessorAffinity=0x8
            } elseif($p.ProcessorAffinity -eq 0x8){
                $p.ProcessorAffinity=0x1
            }
        } elseif($migration_mode -eq "rotation"){
            #Set processor affinity mask to rotate between all 8 cores
            if($p.ProcessorAffinity -eq 0x1){
                $p.ProcessorAffinity=0x2
            } elseif($p.ProcessorAffinity -eq 0x2){
                $p.ProcessorAffinity=0x4
            } elseif($p.ProcessorAffinity -eq 0x4){
                $p.ProcessorAffinity=0x8
            } elseif($p.ProcessorAffinity -eq 0x8){
                $p.ProcessorAffinity=0x10
            } elseif($p.ProcessorAffinity -eq 0x10){
                $p.ProcessorAffinity=0x20
            } elseif($p.ProcessorAffinity -eq 0x20){
                $p.ProcessorAffinity=0x40
            } elseif($p.ProcessorAffinity -eq 0x40){
                $p.ProcessorAffinity=0x80
            } elseif($p.ProcessorAffinity -eq 0x80){
                $p.ProcessorAffinity=0x1
            }
        } elseif($migration_mode -eq "random"){
            #Set processor affinity mask to migrate to random cores
            $core = Get-Random -Maximum 8
            switch($core){
                0 {$p.ProcessorAffinity=0x1; break}
                1 {$p.ProcessorAffinity=0x2; break}
                2 {$p.ProcessorAffinity=0x4; break}
                3 {$p.ProcessorAffinity=0x8; break}
                4 {$p.ProcessorAffinity=0x10; break}
                5 {$p.ProcessorAffinity=0x20; break}
                6 {$p.ProcessorAffinity=0x40; break}
                7 {$p.ProcessorAffinity=0x80; break}
            }
        }
        # sleep between each migration
        Start-Sleep -s $migration_sleep_period
    }
    $p.Kill()
} else {
    # migrate indefinitely, until the process is manually killed
    while($true){
        if($p.HasExited){
            # test process has terminated, so kill the logger and exit
            $logger.Kill()
            exit
        }
        if($migration_mode -eq "none"){
            # leave processor affinity mask alone
        } elseif($migration_mode -eq "single"){
            #Set processor affinity mask to a single core for baseline homogeneous testing
            $p.ProcessorAffinity=0x1
        } elseif($migration_mode -eq "bounce"){
            #Set processor affinity mask to bounce between two cores
            if($p.ProcessorAffinity -eq 0x1){
                $p.ProcessorAffinity=0x8
            } elseif($p.ProcessorAffinity -eq 0x8){
                $p.ProcessorAffinity=0x1
            }
        } elseif($migration_mode -eq "rotation"){
            #Set processor affinity mask to rotate between all 8 cores
            if($p.ProcessorAffinity -eq 0x1){
                $p.ProcessorAffinity=0x2
            } elseif($p.ProcessorAffinity -eq 0x2){
                $p.ProcessorAffinity=0x4
            } elseif($p.ProcessorAffinity -eq 0x4){
                $p.ProcessorAffinity=0x8
            } elseif($p.ProcessorAffinity -eq 0x8){
                $p.ProcessorAffinity=0x10
            } elseif($p.ProcessorAffinity -eq 0x10){
                $p.ProcessorAffinity=0x20
            } elseif($p.ProcessorAffinity -eq 0x20){
                $p.ProcessorAffinity=0x40
            } elseif($p.ProcessorAffinity -eq 0x40){
                $p.ProcessorAffinity=0x80
            } elseif($p.ProcessorAffinity -eq 0x80){
                $p.ProcessorAffinity=0x1
            }
        } elseif($migration_mode -eq "random"){
            #Set processor affinity mask to migrate to random cores
            $core = Get-Random -Maximum 8
            switch($core){
                0 {$p.ProcessorAffinity=0x1; break}
                1 {$p.ProcessorAffinity=0x2; break}
                2 {$p.ProcessorAffinity=0x4; break}
                3 {$p.ProcessorAffinity=0x8; break}
                4 {$p.ProcessorAffinity=0x10; break}
                5 {$p.ProcessorAffinity=0x20; break}
                6 {$p.ProcessorAffinity=0x40; break}
                7 {$p.ProcessorAffinity=0x80; break}
            }
        }

        # sleep between each migration
        Start-Sleep -s $migration_sleep_period
    }
}