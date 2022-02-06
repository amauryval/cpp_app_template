#include <iostream>
#include <gdal/ogrsf_frmts.h>


using namespace std;

int main() {
    GDALAllRegister();
    std::cout << "Hello World!" << endl;
    return 0;
}
