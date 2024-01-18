
'This Code grid search the optimal fractional flexible Fourier frequency (Kstar) which is then incorporated in an ARDL equation object saved as "fourierardl".


matrix(1000,2) matrixAIC=na
!c=1
for !k=0.1 to 4 step 0.01

equation result.ardl(deplags=4, reglags=4) GDPG LOILPBRENT CC CCOILPBRENT AGRGDP UNEMP LINTSEC  @ cos(2*@pi*!k*@obsnum/@obssmpl) sin(2*@pi*!k*@obsnum/@obssmpl)
'please change the dependent and independent variables to yours (dependent variables first, the independent variables follows
'the line above will generate an ARDL equation object
'you can change maximum lags to your choice. deplags denotes the lags for the dependent variable; while reglags is the maximum lags for the explanatory variables.

matrixAIC(!c,2)=newfourierardl.@aic
matrixAIC(!c,1)=!k
!c=!c+1
next
vector minvecAIC=@cimin(matrixAIC)
!indexminAIC=minvecAIC(2)
scalar kstar=matrixAIC(!indexminAIC,1)

show result


