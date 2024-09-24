//First prepare state for panel analysis
xtset c_id year


///////////////////////////////////////////////////////////////////////////////

//Interpolation for missiong values

//UECO
bysort country: ipolate ueco year, gen(ueco1) epolate

//Usage dimension of financial inclusion
//depositors
bysort country: ipolate depositors year, gen(depositors1) epolate
//borrowers
bysort country: ipolate borrowers year, gen(borrowers1) epolate
//outsdep
bysort country: ipolate outsdep year, gen(outsdep1) epolate
//outsloan
bysort country: ipolate outsloan year, gen(outsloan1) epolate
//loanacc
bysort country: ipolate loanacc year, gen(loanacc1) epolate
//vmmt
bysort country: ipolate vmmt year, gen(vmmt1) epolate
//nmmt
bysort country: ipolate nmmt year, gen(nmmt1) epolate
//vmibt
bysort country: ipolate vmibt year, gen(vmibt1) epolate
//nmibt
bysort country: ipolate nmibt year, gen(mibt1) epolate


//Availability dimension of financial inclusion
//branchcomm
bysort country: ipolate branchcomm year, gen(branchcomm1) epolate
//branchcu
bysort country: ipolate branchcu year, gen(branchcu1) epolate
//branchmfi
bysort country: ipolate branchmfi year, gen(branchmfi1) epolate
//branchother
bysort country: ipolate branchother year, gen(branchother1) epolate
//atm
bysort country: ipolate atm year, gen(atm1) epolate
//atm2
bysort country: ipolate atm2 year, gen(atm21) epolate
//mbagents
bysort country: ipolate mbagents year, gen(mbagents1) epolate
//insurance
bysort country: ipolate insurance year, gen(insurance1) epolate


//Access dimension of financial inclusion
//bacc
bysort country: ipolate bacc year, gen(bacc1) epolate
//dacc
bysort country: ipolate dacc year, gen(dacc1) epolate
//dacccu
bysort country: ipolate dacccu year, gen(dacccu1) epolate
//mmacc
bysort country: ipolate mmacc year, gen(mmacc1) epolate


////////////////////////////////////////////////////////////////////////////////

//Principal Component Analysis 

///////////////////////////////////////////////////////////////////////////////

//for Financial Inclusion Index (FII)

//We adopt two stages; First is the computation of the three dimensions 
//of Financial Inclusion (Availability, Access, and Usage);
//The second stage involves the estimation of the overall FII

//FIRST STAGE 
 
//ACCESS DIMENSION
//Variables: depacc mmacc

//Perform Correlation analysis
corr depacc mmacc

//Conduct PCA
pca depacc mmacc

//Plot the eigenvalues corresponding to each component using screeplot 
//screeplot 

//Determine sampling adequacy using the Kaiser-Meyer-Olkin measure 
estat kmo

//Compute the scoring coefficients for each component
predict fiaccess1 fiaccess2

//AVAILABILITY DIMENSION
//Variables: branches mbagents atm1 

//Perform Correlation analysis
corr branches mbagents atm

//Conduct PCA
pca branches mbagents atm

//Plot the eigenvalues corresponding to each component using screeplot 
//screeplot 

//Determine sampling adequacy using the Kaiser-Meyer-Olkin measure 
estat kmo

//Compute the scoring coefficients for each component
predict fiavailability1 fiavailability2 fiavailability3


//USAGE DIMENSION
//Variables: depositors borrowers deposits loans vmmtrans

//Perform Correlation analysis
corr depositors borrowers deposits loans vmmtrans

//Conduct PCA
pca depositors borrowers deposits loans vmmtrans

//Plot the eigenvalues corresponding to each component using screeplot 
//screeplot 

//Determine sampling adequacy using the Kaiser-Meyer-Olkin measure 
estat kmo

//Compute the scoring coefficients for each component
predict fiusage1 fiusage2 fiusage3 fiusage4 fiusage5


//STAGE TWO: Overall FII
//Correlation analysis
corr fiaccess1 fiaccess2 fiavailability1 fiavailability2 fiavailability3 
fiusage1 fiusage2 fiusage3 fiusage4 fiusage5 

//Overall PCA
pca fiaccess1 fiavailability1 fiusage1 

//KMO
estat kmo

predict fii1 fii2 fii3



////PCA for Governance indicators

//Correlation analysis
corr cc ge ps rq rl va

//PCA
pca cc ge ps rq rl va

//KMO
estat kmo

//Predict
predict iq1 iq2 iq3 iq4 iq5 iq6
