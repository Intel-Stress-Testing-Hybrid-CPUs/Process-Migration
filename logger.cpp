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
//#include "processthreadsapi.h"

using namespace std;

string getTimestamp();

int main(int argc, char* argv[]){
    //Open file stream to output file
    ofstream oFile;

    string outputPath = ".\\logging_output\\" + getTimestamp() + ".txt";

    //Generate a new logging output file in the logging_output folder
    oFile.open(outputPath);

    char* procID = argv[1];

    oFile << "PID of new process: " << procID << endl;

    DWORD processID = strtoul(procID, NULL, 10);

    //get a handle to the process launched by the migration script
    HANDLE proc = OpenProcess(PROCESS_QUERY_INFORMATION, FALSE, processID);
    if(proc == NULL){
        oFile << "ERROR opening the process [PID: " << procID << "]" << endl;
    } else {
        // log info about the process
    }

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

/**
 * get the string representation for the current date and time
 * used for logging persistence
 * format: YYYYmonthDD_hr-min-sec  ex:"2022Feb02_13_3_20"
 */
string getTimestamp() {
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

    //Format is yearmonthday_hr-min-sec like "2022Feb02_13_3_20"
    string timeStamp = year + month + day + "_" + hour + "-" + minute + "-" + second;
    return timeStamp;
}