*STEP 1: Descriptive and Summary Statistics
//For statistics per panel: xtsum 
xtsum ueco fii corr ms inf agrgdp trade

//For the averages for the variables: sum
sum ueco fii corr ms inf agrgdp trade


*STEP 2: Correlation Analysis
corr ueco fii corr ms inf agrgdp trade

//For correlation matrix with significance
pwcorr ueco fii corr ms inf agrgdp trade, sig


*STEP 3: Cross-Sectional Dependence
xtcd ueco fii corr ms inf agrgdp 

xtcd trade

 
*STEP 4: Panel Unit Root Tests
//First Generation PURTs
//LLC
xtunitroot llc ueco, lags(aic ) kernel(bartlett nwest)
 
//IPS
xtunitroot ips ueco, (aic, 3)
 
//ADF-Fisher
xtunitroot fisher ueco, dfuller lags(3)

//Second Generation PURT of CIPS (Pesaran, 2007)
xtcips ueco, maxlags(6) bglags(1)
xtcips d.ueco, maxlags(6) bglags(1)
 
xtcips fii, maxlags(6) bglags(1)
xtcips d.fii, maxlags(6) bglags(1)
 
xtcips corr, maxlags(6) bglags(1)
xtcips d.corr, maxlags(6) bglags(1)

xtcips ms, maxlags(6) bglags(1)
xtcips d.ms, maxlags(6) bglags(1)
 
xtcips inf, maxlags(6) bglags(1)
xtcips d.inf, maxlags(6) bglags(1)

xtcips agrgdp, maxlags(6) bglags(1)
xtcips d.agrgdp, maxlags(6) bglags(1)

xtcips trade, maxlags(6) bglags(1)
xtcips d.trade, maxlags(6) bglags(1) 

*STEP 4: Cointegration Test
//Pedroni
xtpedroni ueco fii corr ms inf agrgdp trade, nopdols


*STEP 5: Estimation of DFE, MG, and PMG Models

//Estimate DFE Model and save the result
xtpmg d.ueco d.fii d.corr d.ms d.inf d.agrgdp d.trade, lr(l.ueco fii corr ms inf agrgdp trade) ec(ECT) replace dfe
est sto dfe

//Estimate MG Model and save the result
xtpmg d.ueco d.fii d.corr d.ms d.inf d.agrgdp d.trade, lr(l.ueco fii corr ms inf agrgdp trade) ec(ECT) replace mg
est sto mg

//Cross-section short-run Coefficients
xtpmg d.ueco d.fii d.corr d.ms d.inf d.agrgdp d.trade, lr(l.ueco fii corr ms inf agrgdp trade) ec(ECT) replace full mg

//Estimate PMG Model and save the result
xtpmg d.ueco d.fii d.corr d.ms d.inf d.agrgdp d.trade, lr(l.ueco fii corr ms inf agrgdp trade) ec(ECT) replace pmg
est sto pmg

//Cross-section short-run Coefficients
xtpmg d.ueco d.fii d.corr d.ms d.inf d.agrgdp d.trade, lr(l.ueco fii corr ms inf agrgdp trade) ec(ECT) replace full pmg


*Hausman (1978) Test - to select between PMG and MG, and between PMG and DFE
// Hausman test between PMG and MG
hausman mg pmg, sigmamore


// Hausman test between PMG and DFE
hausman dfe pmg, sigmamore

