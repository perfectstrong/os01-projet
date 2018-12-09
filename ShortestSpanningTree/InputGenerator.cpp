#include <iostream>
#include <fstream>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <string>
#include "MersenneTwister.h"

#define SEED 2018 //seed used

using namespace std;

static MTRand generator; // Mersenne Twister PRNG

//generate a list of points and register it in a input file
//using a Pseudo Random Number Generator (PRNG) from Mersenne Twister
void gen(MTRand generator, int n, double maxX, double maxY) {
    ofstream f;
    char buff[100];
    snprintf(buff, sizeof(buff), "./input/input_%d_%d_%d.txt",n,(int) maxX,(int) maxY);
    string s = buff;
    f.open(s);
    f << n << endl;
    f << maxX << " " << maxY << endl;
    double x, y;
    for (int i = 0; i < n; i++) {
        x = maxX * (1 - generator.randExc()); // or x = generator.randDblExc(maxX);
        y = maxY * (1 - generator.randExc()); // or y = generator.randDblExc(maxY);
        f << x << " " << y << endl;
    }
    f.close();
}

//generate the input data
int main() {
    
    const int num = 7;
    double tests[num][3] = {
        {5, 10, 10}, //5 points, X from 0 to 10, Y from 0 to 10
        {10, 10, 10},
    {100, 10, 10},
    {200, 10, 10},
    {500, 10, 10},
    {1000, 10, 10},
    {10000, 10, 10}
    };
    generator.seed(SEED);
    for (int i = 0; i < num; i++) {
        gen(generator,tests[i][0], tests[i][1], tests[i][2]);
    }
    return 0;
}
