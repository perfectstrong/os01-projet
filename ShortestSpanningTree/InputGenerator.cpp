#include <iostream>
#include <fstream>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <string>
#include "MersenneTwister.h"

#define SEED 901691 //seed used

using namespace std;

//generate a list of points and register it in a input file (returning
// the name of the file)
//using a Pseudo Random Number Generator (PRNG) from Mersenne Twister
string gen(MTRand generator, int n, double maxX, double maxY) {
    ofstream f;
    char buff[100];
    snprintf(buff, sizeof(buff), "./input/input_%d_%d_%d.txt",n,(int) maxX,(int) maxY);
    string s = buff;
    f.open(s);
    if (!f.is_open()) return "error";
    f << n << endl;
    f << maxX << " " << maxY << endl;
    double x, y;
    for (int i = 0; i < n; i++) {
        x = generator.randDblExc(maxX);
        y = generator.randDblExc(maxY);
        f << x << " " << y << endl;
    }
    f.close();
    return s;
}

//generate the input data
int main() {
    MTRand generator; // Mersenne Twister PRNG
    generator.seed(SEED);
    const int num = 7;
    double tests[num][3] = {
        {5, 10, 10}, //5 points, X from 0 to 10, Y from 0 to 10
        {10, 10, 10},
    {100, 10, 10},
    {200, 10, 10},
    {500, 10, 10},
    {1000, 10, 10},
    {10000, 100, 100}
    };
    string testslist[num];
    for (int i = 0; i < num; i++) {
        testslist[i] = gen(generator,tests[i][0], tests[i][1], tests[i][2]);
    }
    ofstream f;
    f.open("testslist.txt");
    if (!f.is_open()) return 1;
    for (int i = 0; i < num; i++) {
        f << testslist[i] << endl;
    }
    f.close();
    return 0;
}
