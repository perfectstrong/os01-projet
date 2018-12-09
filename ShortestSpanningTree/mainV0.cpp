#include <iostream>
#include <fstream>
#include <string>
#include "Network.h"

using namespace std;

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

int main() {
    string filename = "";
    cout << "input = ";
    getline(cin, filename);
    addNode(0);
    readInputPoints(filename);
    calculateDist2();
    growNetwork();
    writeOut("./output/outputV0_" + filename);
    return 0;
}
