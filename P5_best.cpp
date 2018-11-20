//Adrien Wartelle
// à tester ...
#include <iostream>
#include <cstdlib>
#include <ctime>

#define NMAX 1000 //max number of nodes
#define MMAX (NMAX - 1) //max number of connections (max n-1 because it's a minimum spanning tree)

using namespace std;

typedef struct Node{
    double x;
    double y;
}Node;

typedef struct Tree{
    int n; //number of nodes
    int m; //number of connections
    Node T[NMAX]; //nodes
    Node C[MMAX][2]; //connections
}Tree;

int main() {
    srand (time(NULL));
    const int n = 100;
    Tree T; //Tree of nodes
    Node U[n]; // list of nodes
    int V[n]; // list of nearest neighbor (V[i] index of n.n. of i in U
    // which is in the tree)
    bool inTree[n];
    int last_added_node=0;
    // from 0 : T.n-1 -> already in tree
    // from T.n to n-1 to inspect
    double D[n*n]; // distances
    
    
    //Add eletric central
    U[0].x = 0;
    U[0].y = 0;
    T.T[0] = U[0];
    T.n = 1;
    T.m = 0;
    V[0] =0;
    inTree[0] = true;
    //Init houses
    for(int i=1; i<n; i++) {
        U[i].x = 10. * (double(rand()) / RAND_MAX);
        U[i].y = 10. * (double(rand()) / RAND_MAX);
        V[i] = 0;
        inTree[i] = false;
    }
    //Compute distances
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
                D[i*n+j] = (U[i].x - U[j].x)*(U[i].x - U[j].x) +
             (U[i].y - U[j].y)*(U[i].y - U[j].y);
        }
    }
    
    //Clever algorithm O(n^2)
    for(int i=0; i<n-1; i++) { // for each lign to add to the tree
        int o=last_added_node;
        int p=1; //index of node not in tree to add to the tree
        int q=1; //index of node in tree to which a connection is made
        double dist_min = 201; //max distance 200
        for(int j=0; j<n; j++) { // for each node in U
            if(inTree[j] == false) { //for nodes outside of tree T
                if(D[o*n+j] < D[V[j]*n+j]) { //update nearest neighbor 
                    V[j] = o;
                }
                if(D[V[j]*n+j] < dist_min) { //find best lign to add
                    dist_min = D[V[j]*n+j];
                    p = j;
                    q = V[j];
                }
            }
        }
        //add new node to tree
        T.T[T.n] = U[p];
        T.n++;
        //add new connection/lign to the tree
        T.C[T.m][0] = U[q];
        T.C[T.m][1] = U[p];
        T.m++;
        inTree[p] = true;
        last_added_node = p;
    }
    
    //Print Results
    cout << " Nodes : " << endl;
    for(int i=0; i<n; i++)
    {
        cout << "(" << T.T[i].x << "," << T.T[i].y << ")" << endl;
    }
    cout << " Connections of the tree : " << endl;
    for(int i=0; i<n-1; i++)
    {
        cout << "(" << T.C[i][0].x << "," << T.C[i][0].y << ") to ";
        cout << "(" << T.C[i][1].x << "," << T.C[i][1].y << ")" << endl;
    }
    //~ cout << " Presence in the tree " << endl;
    //~ for(int i=0; i<n; i++)
    //~ {
        //~ cout << inTree[i] << endl;
    //~ }
    
    return 0;
}
