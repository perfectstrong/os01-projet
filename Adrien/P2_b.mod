## Nombres et ensembles ##
set HV; #huiles végétales
set HH;  #huiles hydrogénées
set H := HV union HH; #huiles brutes
set HA; #huiles acides
set HB; #huile basique (ou plusieurs) de compensation pour les huiles acides
param m; #nombre de mois
set J:={1..m}; #mois
param M; #grand nombre

## Prix et coûts ##
#coûts/prix d'achats en euros par tonne d'huiles brutes pour chaque mois 
#(réels puis estimés)
param c_a{i in H,j in J}; 
param c_v; #coût/prix de vente en euros par tonne
param c_s; #coût de stockage en euros par tonne par mois

## Raffinage ##
#quantités maximale de raffinage
param q_r_vmax; #pour les huiles végétales
param q_r_hmax; #pour les huiles hydrogénées
param n_r_max; #nombre de composants maximum pour le raffinage
#quantité minimale par huile (lorsque choisie)
param q_r_min;

## Stocks ##
param s_init{i in H}; #stocks initiaux de chaque huile
param s_fin{i in H}; #stocks finaux de chaque huile
param s_max{i in H}; #stocks maximaux de chaque huile

## Viscosités ##
param v_min; #viscosité minimale du produit final
param v_max; #viscosité maximale du produit final
param v{i in H}; #viscosité de chaque huile brute

display c_a;

## Variables ##
#quantités de raffinage pour chaque huile et chaque mois
var q_r{i in H,j in J} >= 0; 
#quantités de commande pour chaque huile et chaque mois
var q_c{i in H,j in J} >= 0; 
#stocks pour chaque huile et chaque mois (avec stock initial)
var s{i in H,j in 0..m} >= 0; 
#variables de décision d'huiles choisies pour le raffinage
var x{i in H,j in J} binary;

## Fonction objective ##
maximize profit : sum{i in H, j in J} (c_v*q_r[i,j] - c_a[i,j]*q_c[i,j]- s[i,j]*c_s);
    
## Contraintes ##

## Raffinage ##
#avec le stock disponible et la commande
raffinage_max_sc{i in H, j in J} : q_r[i,j] <= s[i,j-1] + q_c[i,j];
#avec le raffinage mensuel maximale en huiles végétales
raffinage_max_v{j in J} : sum{i in HV} q_r[i,j] <= q_r_vmax;
#avec le raffinage mensuel maximale en huiles hydrogénées
raffinage_max_h{j in J} : sum{i in HH} q_r[i,j] <= q_r_hmax;
#avec la décision des composants choisies (en utilisant M)
raffinage_decis{i in H, j in J} : q_r[i,j] <= M*x[i,j];
#avec le raffinage minimale par huile choisie
raffinage_min{i in H, j in J} :  q_r[i,j] >= q_r_min*x[i,j];

## Choix d'huiles ## 
#avec le nombre maximum d'huiles pour le produit final
nombre_huiles{j in J} : sum{i in H} x[i,j] <= n_r_max;
#avec l'ajout d'une huile basique (ou plusieurs) pour compenser les huiles acides
melangeBA{i_a in HA, i_b in HB, j in J} : x[i_b,j] >= x[i_a,j];

## Stocks ##
#avec les stocks initiaux
stock_init{i in H} : s[i,0] = s_init[i];
#avec la récursivité des stocks
stock_rec{i in H,j in J} : s[i,j] = s[i,j-1] + q_c[i,j] - q_r[i,j]; 
#avec les stocks finaux
stock_fin{i in H} : s[i,m] = s_fin[i];
#avec les stocks maximaux
stock_max{i in H,j in J} : s[i,j] <= s_max[i];

## Viscosité ##
#avec la viscosité maximale du produit final
visco_max{j in J} : sum{i in H} q_r[i,j]*v[i] <= v_max*sum{i in H} q_r[i,j];
#avec la viscosité minimale du produit final
visco_min{j in J} : sum{i in H} q_r[i,j]*v[i] >= v_min*sum{i in H} q_r[i,j];

solve;
display profit, q_r, q_c, s, x;

