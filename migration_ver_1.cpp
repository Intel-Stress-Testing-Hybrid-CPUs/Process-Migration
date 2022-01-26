/* migration version 1.0
*  Intel Stress Testing Hybrid CPUs Senior Design Project
*  
*  This program is a running executable that outputs its current running processor core
*/

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include "Windows.h"
#include "processthreadsapi.h"

using namespace std;

int main(int argc, char* argv[]){
    //Open file stream to output file
    ofstream oFile;

    //Get timestamp for output file 
    SYSTEMTIME lt;
    GetLocalTime(&lt);
    string year = std::to_string(lt.wYear);
    string month;
    switch(lt.wMonth){
        case 1: 
            month = "Jan";
            break;
        case 2: 
            month = "Feb";
            break;
        case 3: 
            month = "Mar";
            break;
        case 4: 
            month = "Apr";
            break;
        case 5: 
            month = "May";
            break;
        case 6: 
            month = "Jun";
            break;
        case 7: 
            month = "Jul";
            break;
        case 8: 
            month = "Aug";
            break;
        case 9: 
            month = "Sep";
            break;
        case 10: 
            month = "Oct";
            break;
        case 11: 
            month = "Nov";
            break;
        case 12: 
            month = "Dec";
            break;
    }    
    string day = std::to_string(lt.wDay);
    string hour = std::to_string(lt.wHour);
    string minute = std::to_string(lt.wMinute);
    string second = std::to_string(lt.wSecond);

    string timeStamp = year + month + day + "_" + hour + "-" + minute + "-" + second;
    string outputPath = "C:\\Users\\nickt\\Documents\\UT\\Intel-Stress-Testing-Hybrid-CPUs\\Process-Migration\\logging_output\\" + timeStamp + ".txt";

    //Generate a new logging output file in the logging_output folder
    oFile.open(outputPath);

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