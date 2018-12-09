#include <iostream>
#include <fstream>
#include <cmath>
#include <string>

using namespace std;

#ifndef NETWORK_H
#define NETWORK_H

#define NMAX 10000 //max number of nodes

struct Point {
    double x;
    double y;
};

struct Network {
    int n = 0; //number of points
    int m = 0; //number of connections
    int node[NMAX] = {-1}; //points
    int edge[NMAX - 1][2]; //connections (max being number of nodes -1)
};

//Local variables
static Network network;
static int N; // total number of points on map
static double maxX;
static double maxY;
static Point root = { 0, 0 };
static Point inputPoints[NMAX + 1];
static bool inTree[NMAX + 1] = { false };
static double dist2[NMAX + 1][NMAX + 1] = { {0} };
static double totalLength = 0;

//add a node to the network
void addNode(int p) { 
    network.node[network.n] = p;
    inTree[p] = true;
    network.n++;
}

//add a connection (edge) between 2 nodes in the network
void addEdge(int p, int q) {
    network.edge[network.m][0] = p;
    network.edge[network.m][1] = q;
    network.m++;
    totalLength += sqrt(dist2[p][q]);
}

//read input points (to construct the nodes for the network) from 
//an input file, the first point taken as the root of the tree
//to construct
void readInputPoints(string filepath) {
    inputPoints[0] = root;
    inTree[0] = true;
    ifstream f;
    f.open(filepath);
    if (f.is_open()) {
        // First 2 lines are number of points, max abscissa, max coordinate
        f >> N >> maxX >> maxY;
        // Then coordinates of points
        for (int i = 1; i <= N; i++) {
            f >> inputPoints[i].x >> inputPoints[i].y;
        }
        f.close();
    } else {
        throw invalid_argument("Error on reading");
    }
}

//write the connections of the network to an outputfile
void writeOut(string filepath) {
    ofstream f;
    f.open(filepath);
    //~ if (f.is_open()) {
        f << totalLength << endl;
        for (int i = 0; i < network.m; ++i) {
            f << inputPoints[network.edge[i][0]].x << " "
                << inputPoints[network.edge[i][0]].y << " "
                << inputPoints[network.edge[i][1]].x << " "
                << inputPoints[network.edge[i][1]].y
                << endl;
        }
        f.close();
    //~ } else
        //~ throw invalid_argument("Error on writing");
}

//Caculate the distances betwenn the nodes
void calculateDist2() {
    for (int i = 0; i <= N; ++i) {
        for (int j = i + 1; j <= N; ++j) {
            dist2[i][j] = (inputPoints[i].x - inputPoints[j].x)*(inputPoints[i].x - inputPoints[j].x)
                + (inputPoints[i].y - inputPoints[j].y)*(inputPoints[i].y - inputPoints[j].y);
            dist2[j][i] = dist2[i][j]; // the matrix is symetric
        }
    }
}

#endif //NETWORK_H
