/* migration version 1.0
*  Intel Stress Testing Hybrid CPUs Senior Design Project
*  
*/

#include <iostream>
#include <fstream>
#include <cstdlib>
#include "Windows.h"
#include "processthreadsapi.h"

using namespace std;

int main(){
    //Open file stream to output file output.txt
    ofstream oFile;
    oFile.open("output.txt");

    //Get the total number of processors in the system and output to file
    SYSTEM_INFO sysinfo;
    GetSystemInfo(&sysinfo);
    int numCPU = sysinfo.dwNumberOfProcessors;
    oFile << "Number of processors: " << numCPU << endl;

    //Get current processor number for this executable then output to file
    DWORD processorNumber = GetCurrentProcessorNumber();
    oFile << "Current running proccessor: " << processorNumber << endl;
    
}