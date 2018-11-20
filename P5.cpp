//Adrien Wartelle
#include <iostream>
#include <fstream>
#include <cmath>
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
    bool inTree[n]; //
    double D[n*n]; // distances
    
    //Add eletric central
    U[0].x =0;
    U[0].y =0;
    T.T[0] = U[0];
    T.n =1;
    T.m =0;
    inTree[0]=true;
    
    //Init houses
    for(int i=1; i<n; i++) {
        U[i].x = 10. * (double(rand()) / RAND_MAX);
        U[i].y = 10. * (double(rand()) / RAND_MAX);
        inTree[i] = false;
    }
    //Compute distances
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
                D[i*n+j] = (U[i].x - U[j].x)*(U[i].x - U[j].x) +
             (U[i].y - U[j].y)*(U[i].y - U[j].y);
        }
    }
    
    //Naïve algorithm O(n^3)
    for(int i=0; i<n-1; i++) // for each lign to add to the tree
    {
        int o=0;
        int p=1;
        double dist_min = 201;
        for(int j=0; j<n; j++) { //for each node (in the tree)
            for(int k=0; k<n; k++) { //for each node (not in the tree)
                if(k!=j && inTree[j] && inTree[k] == false 
                    && D[j*n+k] < dist_min) {// verify it's not in the tree
                    //~ cout << D[j*n+k] << " vs " <<  D[o*n+p] << endl;
                    o = j;
                    p = k;
                    dist_min = D[j*n+k];
                }
            }
        }
        //add new node to tree
        T.T[T.n] = U[p];
        T.C[T.m][0] = U[o];
        T.C[T.m][1] = U[p];
        T.n++;
        T.m++;
        inTree[p] = true;
    }
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

//~ int L[n*n]; //indirect sorted index map for distances

//~ void IndirectShellSort(double T[], int L[], int n) {
    //~ int h=1;
    //~ double x;
    //~ int l;
    //~ int j;
    //~ for(int i=0; i<n; i++) {
        //~ L[i] = i;
    //~ }
    //~ while(h<n) {
        //~ h = 2*h + 1;
    //~ }
    //~ h = h / 2; //division entière
    //~ while(h>0) {
        //~ for(int i=h; i<n; i++) {
            //~ l = L[i];
            //~ x = T[l];
            //~ j = i-h;
            //~ while(j>=0 && T[L[j]] > x) {
                //~ //T[L[j+h]]= T[L[j]];
                //~ L[j+h] = L[j];
                //~ j = j-h;
            //~ }
            //~ //T[j+h] = x;
            //~ L[j+h] = l;
            
        //~ }
        //~ h = h/2;
    //~ }
//~ }

//IndirectShellSort(D, L, n*n); //complexité (n*n)^1.5=n^3.5, too complex
    
    //~ for(int i=0; i<n; i++) {
        //~ for(int j=0; j<n; j++) {
            //~ int k, l;
            //~ k = L[i*n+j] % n;
            //~ l = L[i*n+j] / n;
            //~ cout << "(" << U[k].x << "," << U[k].y << ") to ";
            //~ cout << "(" << U[l].x << "," << U[l].y << ")" << endl;
            //~ cout << D[L[i*n+j]] << endl;
        //~ }
    //~ }
