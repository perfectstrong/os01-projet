#include <iostream>
#include <fstream>
#include <string>
#include <chrono>
#include "Network.h"

using namespace std;
using namespace std::chrono;

// Naive algorithm O(n^3)
void growNetwork() {
    for (int i = 1; i <= N; ++i) {
        // Each time we add a new edge
        int newEdgeStart = 0; // should be in network
        int newEdgeEnd = -1; // should be outside network
        double dist2Min = maxX * maxX + maxY * maxY;
        // Search for new shortest edge
        // O(n^2)
        for (int j = 0; j <= N; ++j) {
            if (!inTree[j]) continue;
            for (int k = 0; k <= N; ++k) {
                if (k!= j && !inTree[k] && dist2[j][k] < dist2Min) {
                    newEdgeStart = j;
                    newEdgeEnd = k;
                    dist2Min = dist2[j][k];
                }
            }
        }
        addNode(newEdgeEnd);
        addEdge(newEdgeStart, newEdgeEnd);
    }
}

high_resolution_clock::time_point now() {
    return high_resolution_clock::now();
}

//arg1 : input file, arg2 : output file
int main(int argc,char* argv[]) {
    high_resolution_clock::time_point start, finish;
    duration<double, std::milli> timespan;
    
    string filename  =  argv[1]; //TODO
    addNode(0);
    readInputPoints(filename);
    calculateDist2();
    
    start = now();
    growNetwork();
    finish = now();
    timespan = finish - start;
    cout << "Time = " << timespan.count() << " ms" << endl;
    writeOut(argv[2]);
    return 0;
}
