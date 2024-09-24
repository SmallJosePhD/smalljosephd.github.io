//First set the program to perform panel analysis
xtset c_id year
//Do file to perform Principal Component Analysis 
//for Financial Inclusion Index (FII)

//We adopt two stages; First is the computation of the three dimensions 
//of Financial Inclusion (Availability, Access, and Usage);
//The second stage involves the estimation of the overall FII


//FIRST STAGE 
 
//ACCESS DIMENSION
//Variables: accounts mmacc

//Perform Correlation analysis
corr bankacc mmac

//Conduct PCA
pca bankacc mmacc

//Plot the eigenvalues corresponding to each component using screeplot 
screeplot 

//Determine sampling adequacy using the Kaiser-Meyer-Olkin measure 
estat kmo

//Compute the scoring coefficients for each component
predict pc1 pc2

rename pc1 access1
rename pc2 access2

//USAGE DIMENSION
//Variables: cpsbank borrowers loanacc outsdeposit mintbank depositors


//Perform Correlation analysis
corr depositors borrowers outsdep outsloan loanacc vmmt vmibt

//Conduct PCA
pca depositors borrowers outsdep outsloan loanacc vmmt vmibt

//Plot the eigenvalues corresponding to each component using screeplot 
screeplot 

//Determine sampling adequacy using the Kaiser-Meyer-Olkin measure 
estat kmo

//Compute the scoring coefficients for each component
predict pc1 pc2 pc3 pc4 pc5 pc6 pc7

rename pc1 usage1
rename pc2 usage2
rename pc3 usage3
rename pc4 usage4
rename pc5 usage5
rename pc6 usage6
rename pc7 usage7

//AVAILABILITY DIMENSION
//Variables: branch atm insurance

//Perform Correlation analysis
corr atm branch mbagents insurance

//Conduct PCA
pca atm branch mbagents insurance

//Plot the eigenvalues corresponding to each component using screeplot 
screeplot 

//Determine sampling adequacy using the Kaiser-Meyer-Olkin measure 
estat kmo

//Compute the scoring coefficients for each component
predict pc1 pc2 pc3 pc4

rename pc1 avail1
rename pc2 avail2
rename pc3 avail3
rename pc4 avail4




//STAGE TWO: Overall FII
//Correlation analysis
corr access1 access2 usage1 usage2 usage3 usage4 usage5 usage6 usage7 avail1 avail2 avail3 avail4

//Overall PCA
pca access1 usage1 avail1 

//KMO
estat kmo

predict pc1 pc2 pc3

//Rename
rename pc1 fii1
rename pc2 fii2
rename pc3 fii3




////PCA for Governance indicators

//Correlation analysis
corr cc ge ps rq rl va

//PCA
pca cc ge ps rq rl va

//KMO
estat kmo

//Predict
predict pc1 pc2 pc3 pc4 pc5 pc6

rename pc1 iq1
rename pc2 iq2
rename pc3 iq3
rename pc4 iq4
rename pc5 iq5
rename pc6 iq6
