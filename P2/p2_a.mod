set V; # huiles vegetales brutes
set H; # huiles hydrogenees brutes
set B := V union H; # huiles brutes
param N, integer, > 0; # nombre de mois a planifier
param p{i in B, j in 1..N}; # cout d'achat de l'huile i au mois j
param p_f, > 0; # euro / tonne # prix vendu de produit final
param V_max, > 0; # raffinage maximale d'huiles vegetales
param H_max, > 0; # raffinage maximale d'huiles hydrogenees
param SM{i in B}, > 0; # stock maximale de l'huile i
param c_s, > 0; # euro / tonne / mois. Cout de stock
param SI{i in B}, > 0, <= SM[i]; # stock initial de l'huile i.
param SF{i in B}, > 0, <= SM[i]; # stock final de l'huile i.
param v_min, > 0; # viscosite minimale de produit final
param v_max, > 0, > v_min; # viscosite maximale de produit final
param v{i in B}, > 0; # viscosite de l'huile i

var a{i in B, j in 1..N}, >= 0; # achat de l'huile i au mois j
var s{i in B, j in 0..N}, >= 0, <= SM[i]; # stock de l'huile i au mois j
var r{i in B, j in 1..N}, >= 0; # raffinage de l'huile i au mois j

maximize profit:
	(sum{i in B, j in 1..N} r[i, j] * p_f) # benefice
	- (sum{i in B, j in 1..N} a[i, j] * p[i, j]) # achat
	- c_s * (sum{i in B, j in 1..N} s[i, j]) # stock
	;

subject to raffinageHuileVegetaleMaximal{j in 1..N}:
	sum{i in V} r[i, j] <= V_max;

subject to raffinageHuileHydrogeneesMaximal{j in 1..N}:
	sum{i in H} r[i, j] <= H_max;

subject to viscositeMaximum{j in 1..N}:
	(sum{i in B} (r[i, j] * v[i])) <= v_max * (sum{i in B} r[i, j]);

subject to viscositeMinimum{j in 1..N}:
	(sum{i in B} (r[i, j] * v[i])) >= v_min * (sum{i in B} (r[i, j]));

subject to storageEquation{i in B, j in 1..N}:
	s[i, j] = s[i, j - 1] + a[i, j] - r[i, j];

subject to storageInitial{i in B}:
	s[i, 0] = SI[i];

subject to storageFinal{i in B}:
	s[i, N] = SF[i];

solve;
printf "Le profit maximal apres %d mois: %d (euros)\n", N, profit;
for {j in 1..N} {
	printf "Au mois %d :\n", j;
	for {i in B} {
		printf "  Pour l'huile %s :\n", i;
		printf "    Acheter : %d tonne(s)\n", a[i, j];
		printf "    Raffiner : %d tonne(s)\n", r[i, j];
		printf "    Stocker : %d tonne(s)\n", s[i, j];
	}
}
end;
