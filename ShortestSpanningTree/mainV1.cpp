#include <iostream>
#include <fstream>
#include <string>
#include <chrono>
#include "Network.h"


using namespace std;
using namespace std::chrono;


// Improved algorithm O(n^3)
void growNetwork() {
    for (int i = 1; i <= N; ++i) {
        // Each time we add a new edge
        int newEdgeStart = 0; // should be in network
        int newEdgeEnd = -1; // should be outside network
        double dist2Min = maxX * maxX + maxY * maxY;
        // Search for new shortest edge
        // O(n^2)
        for (int j = 0; j < network.n; ++j) {
            // j indicates index of a node in network
            int inNode = orderedPoints[j];
            for (int k = network.n; k <= N; ++k) {
                // k indicates index of a node outside of network
                int outNode = orderedPoints[k];
                if (dist2[inNode][outNode] < dist2Min) {
                    newEdgeStart = j;
                    newEdgeEnd = k;
                    dist2Min = dist2[inNode][outNode];
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

