#include <iostream>
#include <fstream>
#include <string>
#include <chrono>
#include "Network.h"

using namespace std;
using namespace std::chrono;

// Best algorithm O(n^2)
void growNetwork() {
    for (int i = 1; i <= N; ++i) {
        // Each time we add a new edge
        int newEdgeStart = 0; // should be in network
        int newEdgeEnd = -1; // should be outside network
        double dist2Min = maxX * maxX + maxY * maxY;
        for (int j = 0; j <= N; ++j) {
            if (!inTree[j]) {
                // Check a node outside network
                // Update nearest neighbor
                if (dist2[newestNode][j] < dist2[nearestNetworkNeighbor[j]][j]) {
                    nearestNetworkNeighbor[j] = newestNode;
                }
                // Find shortest line to add
                if (dist2[nearestNetworkNeighbor[j]][j] < dist2Min) {
                    dist2Min = dist2[nearestNetworkNeighbor[j]][j];
                    newEdgeStart = nearestNetworkNeighbor[j];
                    newEdgeEnd = j;
                    
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

