// Example program
#include <iostream>
#include <string>
#include <cstdlib>
#include<time.h>   // Thư viện thời gian

using namespace std;

int random(int minN, int maxN){
    return minN + rand() % (maxN + 1 - minN);
}

int main()
{
    int A[1000000] = {0};
    int B[1000] = {0};
    
    
    int r;
    clock_t start, end;
    float time1,time2;
    
    start = clock();  
    int x;
    
    for(int i = 0; i < 100000000; i++)
    {
        r = random(0,1000000);
        x = A[r];
    }
    end = clock(); 
    time1 = (double)(end - start) / CLOCKS_PER_SEC;
    
    
     start = clock();  
    for(int i = 0; i < 100000000; i++)
    {
        r = random(0,999);
        x = B[r];
    }
    end = clock(); 
    time2 = (double)(end - start) / CLOCKS_PER_SEC;
    
    cout<<endl<<"time A -  "<<time1<<endl;
    cout<<"time B - "<<time2;
    
    
}