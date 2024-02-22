'CODE SNIPPET TO PERFORM THE MT-NARDL MODEL WITH FOUR-THRESHOLDS/FIVE PARTIAL SUMS

'SECTION A: SPECIFICATIONS OF THE VARIABLES

'Specify the variable to be decomposed (variable of interest)
genr decvar = x 					'Change "x" to the name of the variable of interest to be decomposed

'Specify the dependent variable
genr depvar = y				'Change "y" to the name of the dependent variable


'Specify the independent variable (excluding the decomposed variables):
group explvars x1 x2 x3			'Change "x1", "x2", and "x3" to the controle variables in the model. Note: the variable to be decomposed (specified at line 7) should not be included


'--------------------------------------------------------------------------------------------------------
'SECTION B: COMPUTATION OF THE THRESHOLDS

'Create the threshold series for four thresholds, five partial sums:
genr thresh1 = @quantile(d(decvar), 0.20)							 				'Note: the specified thresholds can be changed from 20, 40, 60 and 80 quantiles to desired quantiles
genr thresh2 = @quantile(d(decvar), 0.40)
genr thresh3 = @quantile(d(decvar), 0.60)
genr thresh4 = @quantile(d(decvar), 0.80)


'Here we create the regimes (five partial sums).
genr x_up = @cumsum((d(decvar) <= thresh1)*d(decvar))
genr x_mid1 = @cumsum(((d(decvar) > thresh1) and (d(decvar) <= thresh2))*d(decvar))
genr x_mid2 = @cumsum(((d(decvar) > thresh2) and (d(decvar) <= thresh3))*d(decvar))
genr x_mid3 = @cumsum(((d(decvar) > thresh3) and (d(decvar) <= thresh4))*d(decvar))
genr x_low = @cumsum((d(decvar) > thresh4)*d(decvar))


explvars.add x_up x_mid1 x_mid2 x_mid3 x_low						'This line of code adds the partial sums to the group created for explatory variables in line 11


'Here I create a group object to hold the partial sums created above, then I generate a line graph to visualise the partial sums

group partial_sums_three x_up x_mid1 x_mid2 x_mid3 x_low

graph ps_graph_four.line partial_sums_three
show ps_graph_four


'--------------------------------------------------------------------------------------------------------
'SECTION C: ESTIMATING THE MT-NARDL MODEL

'Now we estimate the Multiple Threshold Nonlinear ARDL (MT-NARDL) model with the inclusion of the partial sums (x_up, x_mid1, x_mid2, x_mid3, x_low)

equation mtnardl.ardl(ic = aic, deplags=4, reglags=4) depvar explvars					'This line of code estimates the ARDL model with lags selection based on AIC criterion. it can be changed to “bic” for SIC; “hq” for HQC; or “rbar2” for Adjusted R-squared
                                                                          'If you're using a finite sample, you may want to reduce the maximum lag order from 4 to something smaller.
show mtnardl
