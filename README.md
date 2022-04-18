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

### `/Coreinfo`

### `/OCCT`

### `/prime95`



