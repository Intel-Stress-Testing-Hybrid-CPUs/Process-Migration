# Process-Migration
Repository for all code pertaining to the objective of testing process migration on CPUs.

## Files 
### `logger.cpp`
C++ file that when passed a PID, latches itself onto the corresponding process and logs running information about that process in relation to the running core it is on.

### `logger.exe`
This program is a running executable that latches itself onto a process with its PID and logs running information about that process in relation to the running core it is on.
Creates a timestamped output file in the logging_output folder that outputs relevant logging information on the running process it is handling.

### `process-migrate-script.ps1`
Powershell script for starting a process and retrieving its PID to then give as a launch argument to logger.exe.
