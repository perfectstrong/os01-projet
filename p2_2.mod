# FABRICATION D'HUILES
set huilesVeg;
set huilesHyd;
set huiles := huilesVeg union huilesHyd;
# set dependances within huiles cross huiles; # certaines huiles acides necessite huiles basiques pour neutraliser
set huilesA within huiles;
set huilesB within huiles;
param N, integer, > 0;
set mois := {1..N};
param coutEstime{i in huiles, j in mois}; # cout estime d'achat de huile i pendant mois j
param prix, > 0; # prix de vente, euro / tonne
param vegRaffMax, > 0; # tonnes. Quantite de raffinage maximale de l'huile vegetarien
param hydRaffMax, > 0; # tonnes. Quantite de raffinage maximale de l'huile hydroique
param stockMax{i in huiles}, > 0; # tonnes
param coutStock, > 0; # euro / tonne / mois
param stockInit{i in huiles}, > 0, <= stockMax[i]; # tonnes
param stockFin{i in huiles}, > 0, <= stockMax[i]; # tonnes
param viscoMin, > 0; # pour prod
param viscoMax, > 0, > viscoMin; # pour prod
param visco{i in huiles}, > 0;
param minRaff, > 0; # tonnes
param maxCompo, > 0;
param M := 1000000; # un tres grand nombre

var achat{i in huiles, j in mois}, >= 0; # tonnes
var raff{i in huiles, j in mois}, >= 0; # tonnes
var stock{i in huiles, j in 0..N}, >= 0, <= stockMax[i]; # tonnes
var usage{i in huiles, j in mois}, binary; # 0 = ne pas utiliser i dans mois j, 1 = utiliser i dans mois j

maximize profit:
	(sum{j in mois, i in huiles} raff[i, j] * prix) # benefice
	- (sum{i in huiles, j in mois} achat[i, j] * coutEstime[i, j]) # achat
	- (sum{i in huiles, j in mois} stock[i, j]) * coutStock # stock
	;

subject to raffinageHuileVegTotalMax{j in mois}:
	sum{i in huilesVeg} raff[i, j] <= vegRaffMax;

subject to raffinageHuileHydTotalMax{j in mois}:
	sum{i in huilesHyd} raff[i, j] <= hydRaffMax;

subject to raffinageHuileMin{i in huiles, j in mois}:
	raff[i, j] >= minRaff * usage[i, j];

subject to raffinageHuileVegMax{i in huiles, j in mois}:
	raff[i, j] <= M * usage[i, j];

subject to maximumComposant{j in mois}:
	sum{i in huiles} usage[i, j] <= maxCompo;

# subject to neutralisation{(iA, iB) in dependances, j in mois}:
# 	usage[iB, j] >= usage[iA, j];

subject to neutralisation{iA in huilesA, iB in huilesB, j in mois}:
	usage[iB, j] >= usage[iA, j];

subject to viscociteCibleMaximum{j in mois}:
	(sum{i in huiles} (raff[i, j] * visco[i])) <= viscoMax * (sum{i in huiles} raff[i, j]);

subject to viscociteCibleMinimum{j in mois}:
	(sum{i in huiles} (raff[i, j] * visco[i])) >= viscoMin * (sum{i in huiles} raff[i, j]);

subject to storageInitial{i in huiles}:
	stock[i, 0] = stockInit[i];

subject to storage{i in huiles, j in mois}:
	stock[i, j] = stock[i, j-1] + achat[i, j] - raff[i, j];

subject to storageFinal{i in huiles}:
	stock[i, N] = stockFin[i];

solve;
printf "Profit maximale:%f\n\n", profit.val;
for {j in mois} {
	printf "Mois %d\n", j;
	printf{i in huiles} "Achat de l'huile %s: %f\n", i, achat[i, j].val;
	printf{i in huiles} "Raffinage de l'huile %s: %f\n", i, raff[i,j].val;
	printf{i in huiles} "Stock de l'huiles %s: %f\n", i, stock[i,j].val;
	printf "\n";
}
end;
