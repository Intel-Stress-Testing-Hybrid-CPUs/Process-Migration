/* migration version 1.0
*  Intel Stress Testing Hybrid CPUs Senior Design Project
*/

#include <iostream>
#include <fstream>
#include <cstdlib>
#include "Windows.h"
#include "processthreadsapi.h"

using namespace std;

int main(){
    ofstream oFile;
    oFile.open("output.txt");

    DWORD processorNumber = GetCurrentProcessorNumber();

    oFile << processorNumber << endl;
    
}