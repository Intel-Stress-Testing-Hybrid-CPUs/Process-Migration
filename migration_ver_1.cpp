/* migration version 1.0
*  Intel Stress Testing Hybrid CPUs Senior Design Project
*  
*  This program is a running executable that outputs its current running processor core
*/

#include <iostream>
#include <fstream>
#include <cstdlib>
#include "Windows.h"
#include "processthreadsapi.h"

using namespace std;

int main(int argc, char* argv[]){
    //Open file stream to output file output.txt
    ofstream oFile;
    oFile.open("C:\\Users\\nickt\\Documents\\UT\\Intel-Stress-Testing-Hybrid-CPUs\\Process-Migration\\output.txt");

    char* procID = argv[1];

    oFile << "PID of new process: " << procID << endl;

    /*

    //Get the total number of processors in the system and output to file
    SYSTEM_INFO sysinfo;
    GetSystemInfo(&sysinfo);
    int numCPU = sysinfo.dwNumberOfProcessors;
    oFile << "Number of processors: " << numCPU << endl;

    //Loop for 1000 iterations
    for(int  i = 0; i < 1000000; i++){
    //Get current processor number for this executable then output to file
        DWORD processorNumber;
        if(i == 0){
            DWORD processorNumber = GetCurrentProcessorNumber();
            oFile << "Current running proccessor: " << processorNumber << endl;
        } else {
            //On each iteration, only output to files if processorNumber changes value
            DWORD newNumber = GetCurrentProcessorNumber();
            if(newNumber != processorNumber){
                processorNumber = newNumber;
                oFile << "Current running proccessor: " << processorNumber << endl;
            }
        }
    }
    */
    
}