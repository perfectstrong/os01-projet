//Adrien Wartelle
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
    int L[n]; // reordered list of index of nodes; 
    // from 0 : T.n-1 -> already in tree
    // from T.n to n-1 to inspect
    double D[n*n]; // distances
    
    //Add eletric central
    U[0].x = 0;
    U[0].y = 0;
    T.T[0] = U[0];
    T.n = 1;
    T.m = 0;
    L[0] =0;
    //Init houses
    for(int i=1; i<n; i++) {
        U[i].x = 10. * (double(rand()) / RAND_MAX);
        U[i].y = 10. * (double(rand()) / RAND_MAX);
        L[i] = i; //ordered in the beginning
    }
    //Compute distances
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
                D[i*n+j] = (U[i].x - U[j].x)*(U[i].x - U[j].x) +
             (U[i].y - U[j].y)*(U[i].y - U[j].y);
        }
    }
    
    //Improved algorithm O(n^3/2)
    for(int i=0; i<n-1; i++) { // for each lign to add to the tree
        int o=0;
        int p=1;
        int l=0;
        double dist_min = 201; //max distance 200
        for(int j=0; j<T.n; j++) { //for each node in the tree (0:T.n-1)
            for(int k=T.n; k<n; k++) { //for each node not in the tree (T.n : n)
                if(D[L[j]*n+L[k]] < dist_min) {
                    o = j;
                    p = k;
                    dist_min = D[L[j]*n+L[k]];
                }
            }
        }
        //Swap p and T.n in the list of index
        l=L[T.n];
        L[T.n] = L[p]; // put p-ième index found as the last node of the tree
        L[p] = l;
        //add new node to tree
        T.T[L[T.n]] = U[L[p]];
        T.n++;
        //add new connection/lign to the tree
        T.C[T.m][0] = U[L[o]];
        T.C[T.m][1] = U[L[p]];
        T.m++;
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
