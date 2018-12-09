#include <iostream>
#include <fstream>
#include <string>
#include "Network.h"

//Local variables
static int nearestNetworkNeighbor[NMAX + 1] = { 0 };
static int newestNode = -1;

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

int main() {
    string filename = "";
    cout << "input = ";
    getline(cin, filename);
    addNode(0);
    readInputPoints(filename);
    calculateDist2();
    growNetwork();
    writeOut("./output/outputV2_" + filename);
    return 0;
}
