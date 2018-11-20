# FABRICATION D'HUILES
set huilesVeg;
set huilesHyd;
set huiles := huilesVeg union huilesHyd;
param N, integer, > 0;
set mois := {1..N};
param coutEstime{i in huiles, j in mois};
param prix, > 0; # euro / tonne
param vegRaffMax, > 0; # tonnes
param hydRaffMax, > 0; # tonnes
param stockMax{i in huiles}, > 0; # tonnes
param coutStock, > 0; # euro / tonne / mois
param stockInit{i in huiles}, > 0, <= stockMax[i]; # tonnes
param stockFin{i in huiles}, > 0, <= stockMax[i]; # tonnes
param viscoMin, > 0; # pour prod
param viscoMax, > 0, > viscoMin; # pour prod
param visco{i in huiles}, > 0;
param minRaff, > 0; # tonnes
param maxCompo, > 0;

var achat{i in huiles, j in mois}, >= 0; # tonnes
var raff{i in huiles, j in mois}, >= minRaff; # tonnes
var usage{i in huiles, j in mois}, binary; # 0 = ne pas utiliser i dans mois j, 1 = utiliser i dans mois j

maximize profit:
	(sum{j in mois, i in huiles} raff[i, j] * prix) # benefice
	- (sum{i in huiles, j in mois} achat[i, j] * coutEstime[i, j]) # achat
	- coutStock * (sum{i in huiles, j in mois} # stock total
		(stockInit[i] + sum{k in mois: k <= j} (achat[i, k] - raff[i, k])) # stock de l'huile i au mois j
		)
	;

subject to raffinageHuileVegTotalMax{j in mois}:
	sum{i in huilesVeg} raff[i, j] <= vegRaffMax;

subject to raffinageHuileHydTotalMax{j in mois}:
	sum{i in huilesHyd} raff[i, j] <= hydRaffMax;

subject to raffinageHuileMin{i in huiles, j in mois}:
	raff[i, j] >= minRaff * usage[i, j];

subject to raffinageHuileVegMax{i in huilesVeg, j in mois}:
	raff[i, j] <= vegRaffMax * usage[i, j];

subject to raffinageHuileHydMax{i in huilesHyd, j in mois}:
	raff[i, j] <= hydRaffMax * usage[i, j];

subject to maximumComposant{j in mois}:
	sum{i in huiles} usage[i, j] <= maxCompo;

subject to neutralisationH3V1{j in mois}:
	usage["H3", j] >= usage["V1", j];

subject to neutralisationH3V2{j in mois}:
	usage["H3", j] >= usage["V2", j];

subject to viscociteCibleMaximum{j in mois}:
	(sum{i in huiles} (raff[i, j] * visco[i])) <= viscoMax * (sum{i in huiles} raff[i, j]);

subject to viscociteCibleMinimum{j in mois}:
	(sum{i in huiles} (raff[i, j] * visco[i])) >= viscoMin * (sum{i in huiles} raff[i, j]);

subject to storageMax{i in huiles, j in mois}:
	stockInit[i] + sum{k in mois: k <= j} (achat[i, k] - raff[i, k]) <= stockMax[i];

subject to storageMin{i in huiles, j in mois}:
	stockInit[i] + sum{k in mois: k <= j} (achat[i, k] - raff[i, k]) >= 0;

subject to storageFinal{i in huiles}:
	stockInit[i] + sum{k in mois} (achat[i, k] - raff[i, k]) = stockFin[i];

solve;
printf "Profit maximale:%f\n\n", profit.val;
for {j in mois} {
	printf "Mois %d\n", j;
	printf{i in huiles} "Achat de l'huile %s: %f\n", i, achat[i, j].val;
	printf{i in huiles} "Raffinage de l'huile %s: %f\n", i, raff[i,j].val;
	printf "\n";
}
end;
