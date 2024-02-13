'CODE SNIPPET TO PERFORM THE MULTIPLE THRESHOLD NONLINEAR AUTOREGRESSIVE DISTRIBUTED LAG (MT-NARDL) MODEL

'Specify the variable to be decomposed (variable of interest
genr decvar = inf 					'Change "inf" to the name of the variable of interest to be decomposed

'Specify the dependent variable
genr depvar = lm1				'Change "lm1" to the name of the dependent variable


'Specify the independent variable (excluding the decomposed variables):
group explvars fd lgb			'Change "fd" and "lgb" to the explanatory variables in the model. Note: the variable to be decomposed (specified in line 4) should not be included


'--------------------------------------------------------------------------------------------------------
'SECTION 1: Two threshold, three partial sums

'The code in this section is for two threshold, three partial sums:''''
'****NOTE****: If you intend to estimate a model with more thresholds (the code is in the next section) just put a single quotation mark (') before the codes from line 21 to line 27 (that is the codes (lines) in font colour black).


'Create the threshold series for two thresholds, three partial sums:
genr thresh1 = @quantile(d(decvar), 0.25) 				'Note: the specified thresholds can be changed from 25 and 75 quantiles to, say for instance, 40-60 quantiles or 20-80 quantiles
genr thresh2 = @quantile(d(decvar), 0.75)

'Here we create the regimes (three partial sums).
genr x1 = @cumsum((d(decvar) <= thresh1)*d(decvar))
genr x2 = @cumsum(((d(decvar) > thresh1) and (d(decvar) <= thresh2))*d(decvar))
genr x3 = @cumsum((d(decvar) > thresh2)* d(decvar))

explvars.add x1 x2 x3											'This line of code add the partial sums to the group created for explatory variables in line 11


'Here I create a group object to hold the partial sums created above, then I generate a line graph to visulise the partial sums

graph ps_graph.line x1 x2 x3
show ps_graph


'--------------------------------------------------------------------------------------------------------
'SECTION 3: FOUR THRESHOLDS, FIVE PARTIAL SUMS.


'Create the threshold series for four thresholds, five partial sums:
'genr thresh1 = @quantile(d(devar), 0.20)							 				'Note: the specified thresholds can be changed from 20, 40, 60 and 80 quantiles to decired quantiles
'genr thresh2 = @quantile(d(devar), 0.40)
'genr thresh3 = @quantile(d(devar), 0.60)
'genr thresh4 = @quantile(d(devar), 0.80)


'Here we create the regimes (five partial sums).
'genr x1 = @cumsum((d(devar) <= thresh1)*d(devar))
'genr x2 = @cumsum(((d(devar) > thresh1) and (d(devar) <= thresh2))*d(devar))
'genr x3 = @cumsum(((d(devar) > thresh2) and (d(devar) <= thresh3))*d(devar))
'genr x4 = @cumsum(((d(devar) > thresh3) and (d(devar) <= thresh4))*d(devar))
'genr x5 = @cumsum((d(devar) > thresh4)*d(devar))


'explvars.add x1 x2 x3 x4 x5											'This line of code add the partial sums to the group created for explatory variables in line 11


'Here I create a group object to hold the partial sums created above, then I generate a line graph to visulise the partial sums
'group partial_sums2 x1 x2 x3 x4 x5

'graph ps_graph2.line partial_sums2
'show ps_graph2


'--------------------------------------------------------------------------------------------------------
'ESTIMATING THE MT-NARDL MODEL
'In this section, I estimate the MT-NARDL model with the inclusion of the partical sums generated

'Now we estimate the Multiple Threshold Nonilinear ARDL (MT-NARDL) model with the inclusion of the partial sums (x1, x2, x3)
equation mtnardl.ardl(ic = aic, deplags=4, reglags=4) depvar explvars								'This line of code estimate the ARDL model with lags selection based on AIC criterion. it can be changed to “bic” for SIC; “hq” for HQC; or “rbar2” for Adjusted R-squared
show mtnardl
