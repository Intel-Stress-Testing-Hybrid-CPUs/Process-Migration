/* migration version 1.0
*  Intel Stress Testing Hybrid CPUs Senior Design Project
*/

#include <iostream>
#include <cstdlib>
#include "processthreadsapi.h"

using namespace std;

void main(){
    DWORD processorNumber = GetCurrentProcessorNumber();

    cout << processorNumber << endl;
    

}