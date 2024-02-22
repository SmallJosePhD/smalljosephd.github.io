'CODE SNIPPET TO PERFORM THE MULTIPLE THRESHOLD NONLINEAR AUTOREGRESSIVE DISTRIBUTED LAG (MT-NARDL) MODEL
'The following code snippet is for two thresholds, and three partial sums 

'----------------------------------------------------------------------------------------------------------------------
'SECTION A: SPECIFICATIONS OF THE VARIABLES

'Specify the variable to be decomposed (variable of interest)
genr decvar = x 					'Change "x" to the name of the variable of interest to be decomposed

'Specify the dependent variable
genr depvar = y				'Change "y" to the name of the dependent variable


'Specify the independent variable (excluding the decomposed variables):
group explvars x1 x2 x3			'Change "x1", "x2", and "x3" to the controle variables in the model. Note: the variable to be decomposed (specified at line 7) should not be included


'--------------------------------------------------------------------------------------------------------
'SECTION B: COMPUTATION OF THE THRESHOLDS

'Create the threshold series for two thresholds, three partial sums:
genr thresh1 = @quantile(d(decvar), 0.25) 				'Note: the specified thresholds can be changed from 25 and 75 quantiles to, say for instance, 40-60 quantiles or 20-80 quantiles
genr thresh2 = @quantile(d(decvar), 0.75)

'Next we create the regimes (three partial sums).
genr x_up = @cumsum((d(decvar) <= thresh1)*d(decvar))
genr x_mid = @cumsum(((d(decvar) > thresh1) and (d(decvar) <= thresh2))*d(decvar))
genr x_low = @cumsum((d(decvar) > thresh2)* d(decvar))

explvars.add x_up x_mid x_low							'This line of code adds the partial sums to the group created for explanatory variables in line 14


'Lastly, I create a group object to hold the partial sums created above, then I generate a line graph to visualise the partial sums

graph ps_graph.line x_up x_mid x_low
show ps_graph

'--------------------------------------------------------------------------------------------------------
'SECTION C: ESTIMATING THE MT-NARDL MODEL

'Now we estimate the Multiple Threshold Nonlinear ARDL (MT-NARDL) model with the inclusion of the partial sums (x_up, x_mid, x_low)

equation mtnardl.ardl(ic = aic, deplags=4, reglags=4) depvar explvars					'This line of code estimates the ARDL model with lags selection based on AIC criterion. it can be changed to “bic” for SIC; “hq” for HQC; or “rbar2” for Adjusted R-squared
                                                                          'If you're using a finite sample, you may want to reduce the maximum lag order from 4 to something smaller.
show mtnardl
