# Process-Migration
Repository for all code pertaining to the objective of testing process migration and functional equivalence of cores on CPUs.

##  Description of Repository Components
### `logger-vtune.cpp`
C++ file that when passed a PID, latches itself onto the corresponding process and logs running information about that process in relation to the running core it is on.

### `logger-vtune.exe`
This program is a running executable that latches itself onto a process with its PID and logs running information about that process in relation to the running core it is on.
Creates a timestamped output file in the `/logging_output` folder that outputs relevant logging information on the running process it is handling, such as changes in prossesor affinity.

### `process-migrate-script-vtune.ps1`
Powershell script for starting a process and retrieving its PID to then give as a launch argument to `logger-vtune.exe`. This script then performs various types of migrations to the attached process based on user settings.

### `cfg-process-migrate.txt`
Configurable settings for the `process-migrate-script-vtune.ps1`

### `vtune-script.ps1`
Powershell script that runs VTune analysis on a chosen test. It also launches the migration script to be run on the chosen test as well. The results of the VTune analysis are output to `/vtune_output`.

### `cfg-vtune.txt`
Configurable settings for `vtune-script.ps1` such as test to be run and analysis mode for VTune.

### `/vtune_output`
Results of VTune analysis from `vtune-script.ps1`  are output to this directory.

### `/logging_output`
Results of `logger-vtune.exe` are output to this directory.

### `/coreinfo_output`
Results of `Coreinfo64.exe` are output to this directory.

### `/Coreinfo`
A command-line utility that displays the processor name and supported features, shows you the mapping between logical processors and the physical processor, NUMA node, and socket on which they reside, as well as the cache’s assigned to each logical processor. Coreinfo is useful for gaining insight into the processor and cache topology of your system. 

Used by `vtune-script.ps1` to record this processor information to a timestamped file in `/coreinfo_output`.

### `/OCCT`
A modern stability testing and benchmarking executable with a friendly GUI showing hardware info.
Stability testing supports small to large data sets, and can test on 1 or more cores. Advanced thread settings allow periodic cycling between cores, a basic function of our `process-migrate-script-vtune.ps1`. Stability testing also logs any errors that occur during execution. 
There is also Linpack-based stability testing which uses linear algebra for matrix calculations. 

Can be used as a testing application workload for `vtune-script.ps1` and `process-migrate-script-vtune.ps1`. 

### `/prime95`
A highly configurable stress-testing executable, searching for Mersenne Prime numbers by calculating FFTs.
Can test 1 or more cores, with or without hyperthreading. The data set of FFTs used for calculations range from small to large, targeting the L1/L2 caches up to the L3 cache, memory controller, and RAM.

Can be used as a testing application workload for `vtune-script.ps1` and `process-migrate-script-vtune.ps1`.