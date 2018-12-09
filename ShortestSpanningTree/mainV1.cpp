#include <iostream>
#include <fstream>
#include <string>
#include "Network.h"

using namespace std;

//Local variables
static int orderedPoints[NMAX + 1]; // 0 to network.n-1 are points in tree, others are outside

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

int main(int argc,char* argv[]) {
    string filename  =  argv[1]; //TODO
    addNode(0);
    readInputPoints(filename);
    calculateDist2();
    growNetwork();
    writeOut("outputV1_" + filename);
    return 0;
}
