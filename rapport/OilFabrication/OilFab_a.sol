Problem:    OilFab_a
Rows:       65
Columns:    95
Non-zeros:  310
Status:     OPTIMAL
Objective:  profit = 107842.5926 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 profit       B         107843                             
     2 raffinageHuileVegetaleMaximal[1]
                    NU           200                         200            75 
     3 raffinageHuileVegetaleMaximal[2]
                    NU           200                         200            70 
     4 raffinageHuileVegetaleMaximal[3]
                    NU           200                         200            65 
     5 raffinageHuileVegetaleMaximal[4]
                    NU           200                         200            60 
     6 raffinageHuileVegetaleMaximal[5]
                    NU           200                         200            55 
     7 raffinageHuileVegetaleMaximal[6]
                    NU           200                         200       49.6296 
     8 raffinageHuileHydrogeneesMaximal[1]
                    NU           250                         250            65 
     9 raffinageHuileHydrogeneesMaximal[2]
                    NU           250                         250            60 
    10 raffinageHuileHydrogeneesMaximal[3]
                    NU           250                         250            55 
    11 raffinageHuileHydrogeneesMaximal[4]
                    NU           250                         250            50 
    12 raffinageHuileHydrogeneesMaximal[5]
                    NU           250                         250            45 
    13 raffinageHuileHydrogeneesMaximal[6]
                    NU           250                         250       76.6667 
    14 viscositeMaximum[1]
                    NU             0                          -0         < eps
    15 viscositeMaximum[2]
                    NU             0                          -0         < eps
    16 viscositeMaximum[3]
                    NU             0                          -0         < eps
    17 viscositeMaximum[4]
                    B           -170                          -0 
    18 viscositeMaximum[5]
                    B           -230                          -0 
    19 viscositeMaximum[6]
                    NU             0                          -0        3.7037 
    20 viscositeMinimum[1]
                    B           1350            -0               
    21 viscositeMinimum[2]
                    B           1350            -0               
    22 viscositeMinimum[3]
                    B           1350            -0               
    23 viscositeMinimum[4]
                    B           1180            -0               
    24 viscositeMinimum[5]
                    B           1120            -0               
    25 viscositeMinimum[6]
                    B           1350            -0               
    26 storageEquation[V1,1]
                    NS             0            -0             =            75 
    27 storageEquation[V1,2]
                    NS             0            -0             =            80 
    28 storageEquation[V1,3]
                    NS             0            -0             =            85 
    29 storageEquation[V1,4]
                    NS             0            -0             =            90 
    30 storageEquation[V1,5]
                    NS             0            -0             =            95 
    31 storageEquation[V1,6]
                    NS             0            -0             =            90 
    32 storageEquation[V2,1]
                    NS             0            -0             =            75 
    33 storageEquation[V2,2]
                    NS             0            -0             =            80 
    34 storageEquation[V2,3]
                    NS             0            -0             =            85 
    35 storageEquation[V2,4]
                    NS             0            -0             =            90 
    36 storageEquation[V2,5]
                    NS             0            -0             =            95 
    37 storageEquation[V2,6]
                    NS             0            -0             =           100 
    38 storageEquation[H1,1]
                    NS             0            -0             =           105 
    39 storageEquation[H1,2]
                    NS             0            -0             =           110 
    40 storageEquation[H1,3]
                    NS             0            -0             =           115 
    41 storageEquation[H1,4]
                    NS             0            -0             =           120 
    42 storageEquation[H1,5]
                    NS             0            -0             =           125 
    43 storageEquation[H1,6]
                    NS             0            -0             =           130 
    44 storageEquation[H2,1]
                    NS             0            -0             =            85 
    45 storageEquation[H2,2]
                    NS             0            -0             =            90 
    46 storageEquation[H2,3]
                    NS             0            -0             =            95 
    47 storageEquation[H2,4]
                    NS             0            -0             =           100 
    48 storageEquation[H2,5]
                    NS             0            -0             =           105 
    49 storageEquation[H2,6]
                    NS             0            -0             =            80 
    50 storageEquation[H3,1]
                    NS             0            -0             =            85 
    51 storageEquation[H3,2]
                    NS             0            -0             =            90 
    52 storageEquation[H3,3]
                    NS             0            -0             =            95 
    53 storageEquation[H3,4]
                    NS             0            -0             =           100 
    54 storageEquation[H3,5]
                    NS             0            -0             =           105 
    55 storageEquation[H3,6]
                    NS             0            -0             =           110 
    56 storageInitial[V1]
                    NS           500           500             =            75 
    57 storageInitial[V2]
                    NS           500           500             =            75 
    58 storageInitial[H1]
                    NS           500           500             =           105 
    59 storageInitial[H2]
                    NS           500           500             =            85 
    60 storageInitial[H3]
                    NS           500           500             =            85 
    61 storageFinal[V1]
                    NS           500           500             =           -95 
    62 storageFinal[V2]
                    NS           500           500             =          -105 
    63 storageFinal[H1]
                    NS           500           500             =          -135 
    64 storageFinal[H2]
                    NS           500           500             =           -85 
    65 storageFinal[H3]
                    NS           500           500             =          -115 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 a[V1,1]      NL             0             0                         -35 
     2 a[V1,2]      NL             0             0                         -50 
     3 a[V1,3]      NL             0             0                         -25 
     4 a[V1,4]      NL             0             0                         -30 
     5 a[V1,5]      NL             0             0                          -5 
     6 a[V1,6]      B        659.259             0               
     7 a[V2,1]      NL             0             0                         -45 
     8 a[V2,2]      NL             0             0                         -50 
     9 a[V2,3]      NL             0             0                         -55 
    10 a[V2,4]      NL             0             0                         -20 
    11 a[V2,5]      NL             0             0                         -25 
    12 a[V2,6]      B        540.741             0               
    13 a[H1,1]      NL             0             0                         -25 
    14 a[H1,2]      NL             0             0                       < eps
    15 a[H1,3]      NL             0             0                         -15 
    16 a[H1,4]      B              0             0               
    17 a[H1,5]      NL             0             0                         -25 
    18 a[H1,6]      NL             0             0                         -10 
    19 a[H2,1]      NL             0             0                         -25 
    20 a[H2,2]      B            250             0               
    21 a[H2,3]      NL             0             0                          -5 
    22 a[H2,4]      NL             0             0                         -20 
    23 a[H2,5]      NL             0             0                          -5 
    24 a[H2,6]      B            750             0               
    25 a[H3,1]      NL             0             0                         -30 
    26 a[H3,2]      NL             0             0                         -25 
    27 a[H3,3]      NL             0             0                       < eps
    28 a[H3,4]      NL             0             0                         -25 
    29 a[H3,5]      B            500             0               
    30 a[H3,6]      NL             0             0                         -25 
    31 s[V1,1]      B        340.741             0          1000 
    32 s[V1,2]      B        181.481             0          1000 
    33 s[V1,3]      B        22.2222             0          1000 
    34 s[V1,4]      B              0             0          1000 
    35 s[V1,5]      NL             0             0          1000           -10 
    36 s[V1,6]      B            500             0          1000 
    37 s[V2,1]      B        459.259             0          1000 
    38 s[V2,2]      B        418.519             0          1000 
    39 s[V2,3]      B        377.778             0          1000 
    40 s[V2,4]      B            200             0          1000 
    41 s[V2,5]      B              0             0          1000 
    42 s[V2,6]      B            500             0          1000 
    43 s[H1,1]      B            500             0          1000 
    44 s[H1,2]      B            500             0          1000 
    45 s[H1,3]      B            500             0          1000 
    46 s[H1,4]      B            500             0          1000 
    47 s[H1,5]      B            500             0          1000 
    48 s[H1,6]      B            500             0          1000 
    49 s[H2,1]      B            250             0          1000 
    50 s[H2,2]      B            250             0          1000 
    51 s[H2,3]      B              0             0          1000 
    52 s[H2,4]      B              0             0          1000 
    53 s[H2,5]      NL             0             0          1000           -30 
    54 s[H2,6]      B            500             0          1000 
    55 s[H3,1]      B            500             0          1000 
    56 s[H3,2]      B            500             0          1000 
    57 s[H3,3]      B            500             0          1000 
    58 s[H3,4]      B            250             0          1000 
    59 s[H3,5]      B            500             0          1000 
    60 s[H3,6]      B            500             0          1000 
    61 s[V1,0]      B            500             0          1000 
    62 s[V2,0]      B            500             0          1000 
    63 s[H1,0]      B            500             0          1000 
    64 s[H2,0]      B            500             0          1000 
    65 s[H3,0]      B            500             0          1000 
    66 r[V1,1]      B        159.259             0               
    67 r[V1,2]      B        159.259             0               
    68 r[V1,3]      B        159.259             0               
    69 r[V1,4]      B        22.2222             0               
    70 r[V1,5]      NL             0             0                       < eps
    71 r[V1,6]      B        159.259             0               
    72 r[V2,1]      B        40.7407             0               
    73 r[V2,2]      B        40.7407             0               
    74 r[V2,3]      B        40.7407             0               
    75 r[V2,4]      B        177.778             0               
    76 r[V2,5]      B            200             0               
    77 r[V2,6]      B        40.7407             0               
    78 r[H1,1]      NL             0             0                         -20 
    79 r[H1,2]      NL             0             0                         -20 
    80 r[H1,3]      NL             0             0                         -20 
    81 r[H1,4]      NL             0             0                         -20 
    82 r[H1,5]      NL             0             0                         -20 
    83 r[H1,6]      NL             0             0                    -41.8519 
    84 r[H2,1]      B            250             0               
    85 r[H2,2]      B            250             0               
    86 r[H2,3]      B            250             0               
    87 r[H2,4]      NL             0             0                       < eps
    88 r[H2,5]      NL             0             0                       < eps
    89 r[H2,6]      B            250             0               
    90 r[H3,1]      NL             0             0                       < eps
    91 r[H3,2]      NL             0             0                       < eps
    92 r[H3,3]      NL             0             0                       < eps
    93 r[H3,4]      B            250             0               
    94 r[H3,5]      B            250             0               
    95 r[H3,6]      NL             0             0                     -32.963 

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 5.82e-11 on row 1
        max.rel.err = 1.77e-15 on row 6
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 3.69e-13 on column 69
        max.rel.err = 1.23e-15 on column 69
        High quality

KKT.DB: max.abs.err = 3.41e-13 on column 70
        max.rel.err = 3.41e-13 on column 70
        High quality

End of output
