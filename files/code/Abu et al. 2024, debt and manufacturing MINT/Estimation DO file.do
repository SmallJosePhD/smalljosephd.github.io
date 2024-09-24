*Prepare data for panel analysis
xtset c_id year 

*Interpolate missing values
bysort country: ipolate lman year, gen(lmani) epolate
bysort country: ipolate agrgdp year, gen(agrgdpi) epolate

//For statistics per panel: xtsum 
xtsum lman exdgni ldser lexch lpop fdigdp inf agrgdp

//For the averages for the variables: sum
sum lman exdgni ldser lexch lpop fdigdp inf agrgdp

*STEP 2: Correlation Analysis
corr lman exdgni ldser lexch lpop fdigdp inf agrgdp

//For correlation matrix with significance
pwcorr lman exdgni ldser lexch lpop fdigdp inf agrgdp, sig

*STEP 3: Cross-Sectional Dependence
xtcd lman exdgni ldser lexch lpop 

xtcd fdigdp inf agrgdp

 
*STEP 4: Panel Unit Root Tests
//First Generation PURTs
//LLC
xtunitroot llc lman, lags(aic ) kernel(bartlett nwest)
 
//IPS
xtunitroot ips lman, (aic, 3)
 
//ADF-Fisher
xtunitroot fisher lman, dfuller lags(3)

//Second Generation PURT of CIPS (Pesaran, 2007)
xtcips lman, maxlags(6) bglags(1)
xtcips d.lman, maxlags(6) bglags(1)
 
xtcips exdgni, maxlags(6) bglags(1)
xtcips d.exdgni, maxlags(6) bglags(1)
 
xtcips ldser, maxlags(6) bglags(1)
xtcips d.ldser, maxlags(6) bglags(1)

xtcips lexch, maxlags(6) bglags(1)
xtcips d.lexch, maxlags(6) bglags(1)

xtcips lpop, maxlags(6) bglags(1)
xtcips d.lpop, maxlags(6) bglags(1)
 
xtcips fdigdp, maxlags(6) bglags(1)
xtcips d.fdigdp, maxlags(6) bglags(1)

xtcips inf, maxlags(6) bglags(1)
xtcips d.inf, maxlags(6) bglags(1)

xtcips agrgdp, maxlags(6) bglags(1)
xtcips d.agrgdp, maxlags(6) bglags(1) 

*STEP 4: Cointegration Test
//Pedroni
xtpedroni lman exdgni ldser lexch lpop fdigdp inf agrgdp

*Westerlund panel cointegration test
xtwest lman exdgni ldser lexch lpop fdigdp inf, constant lags(1 1) leads(0 1) lrwindow(1)

*DFE, MG and PMG
//Estimate DFE Model and save the result
xtpmg d.lman d.exdgni d.ldser d.lexch d.lpop d.fdigdp d.inf d.agrgdp, lr(l.lman l.exdgni l.ldser l.lexch l.lpop l.fdigdp l.inf l.agrgdp)ec(ECT) replace dfe
est sto dfe

//Estimate MG Model and save the result
xtpmg d.lman d.exdgni d.ldser d.lexch d.lpop d.fdigdp d.inf d.agrgdp, lr(l.lman l.exdgni l.ldser l.lexch l.lpop l.fdigdp l.inf l.agrgdp) ec(ECT) replace mg
est sto mg

//Cross-section short-run Coefficients
xtpmg d.lman d.exdgni d.ldser d.lexch d.lpop d.fdigdp d.inf d.agrgdp, lr(l.lman l.exdgni l.ldser l.lexch l.lpop l.fdigdp l.inf l.agrgdp)ec(ECT) replace full mg


//Estimate PMG Model and save the result
xtpmg d.lman d.exdgni d.ldser d.lexch d.lpop d.fdigdp d.inf d.agrgdp, lr(l.lman l.exdgni l.ldser l.lexch l.lpop l.fdigdp l.inf l.agrgdp) ec(ECT) replace pmg
est sto pmg

//Cross-section short-run Coefficients
xtpmg d.lman d.exdgni d.ldser d.lexch d.lpop d.fdigdp d.inf d.agrgdp, lr(l.lman l.exdgni l.ldser l.lexch l.lpop l.fdigdp l.inf l.agrgdp) ec(ECT) replace full pmg


*Hausman (1978) Test - to select between PMG and MG, and between PMG and DFE

// Hausman test between PMG and MG
hausman dfe mg, sigmamore

// Hausman test between PMG and DFE
hausman pmg mg, sigmamore
