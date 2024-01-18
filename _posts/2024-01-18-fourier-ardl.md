---
title: Implementation of the Fractional Frequency Flexible Fourier Form ARDL in EViews
date: 2024-01-18
permalink: /posts/2024/01-fourier-ardl
excerpt_separator: <!--more-->
toc: true
tags:
  - Fourier ARDL
  - ARDL bounds testing
  - Bootstrap ARDL
---
Today, I will be providing a rather brief post on the process of implementing the Fourier ARDL bounds testing approach which I applied in my recent paper entitled "**The moderating role of corruption in the oil price-economic growth relationship in an oil-dependent economy: Evidence from Bootstrap ARDL with a Fourier Function**". 

<!--more--> 

# The method 
To implement the Bootstrap ARDL bounds testing estimation strategy adopted in my [paper](/files/pdf/research/2023-oil-corr-growth.pdf), you will need to first download the Fourier ARDL EViews program code [here](/files/private/fourier%20ardl%20eviews%20code.prg) and the [augmented ARDL EViews Addin](/files/private/AugARDL.rar)

Consider the following FARDL(p,q) model:

$$\Delta y_t=\theta+d(t)+\rho y_{t-1}+\gamma x_{t-1} +\sum_{j=1}^{p-1}\psi_j\Delta y_{t-j}+\sum_{j=0}^{q-1}\varphi_j\Delta x_{t-j}+\epsilon_t$$

where

$$d(t)=\sum_{k=1}^n\alpha_k\text{cos}\left(\frac{2\pi k t}{T}\right)+ \sum_{k=1}^n\beta_k\text{sin}\left(\frac{2\pi k t}{T}\right)$$

To analyze this model, you'll encounter a couple of practical considerations that should be addressed early on. The first involves deciding on the frequency at which the estimation will take place. Although it may seem trivial, this choice carries implications for the outcomes. The second consideration is determining the number of Fourier terms to include. In the generic specification provided above, the number of terms is set to $n$. In a more rigorous study, this parameter must be carefully determined. Typically, the various selection criteria (AIC, HQ, or SIC) are employed for this purpose, aiming to identify the value that minimizes the chosen criterion. 

Assuming these two issues have already been resolved, the next step is to proceed with the estimation. Following the approach that utilizes fractional frequency, a single frequency parameter will be employed. However, we'll grid-search for its optimal value. Thus, we state as follows, setting $n=1$:

$$d(t)=\alpha\text{cos}\left(\frac{2\pi k t}{T}\right)+\beta\text{sin}\left(\frac{2\pi k t}{T}\right)$$


# Fractional frequency
In many studies, it is often insightful to determine the fractional frequency rather than imposing a specific integer frequency arbitrarily. This is because the chosen integer frequency may not align well with the characteristics of the data. Therefore, it is crucial to identify the frequency that yields the optimal value based on the selected information criterion. The process of finding this optimal fractional frequency merits attention. In this section, I provide a discussion on how to determine the optimal value in EViews using [this](files/private/fourier%20ardl%20eviews%20code.prg) program code.

## The Code 
Here is the code to generate the fractional frequency parameter value:
```
matrix(1000,2) matrixAIC=na
!c=1
for !k=0.1 to 4 step 0.01

equation result.ardl(deplags=4, reglags=4) GDPG LOILPBRENT CC CCOILPBRENT AGRGDP UNEMP LINTSEC  @ cos(2*@pi*!k*@obsnum/@obssmpl) sin(2*@pi*!k*@obsnum/@obssmpl)
matrixAIC(!c,2)=result.@aic
matrixAIC(!c,1)=!k
!c=!c+1
next
vector minvecAIC=@cimin(matrixAIC)
!indexminAIC=minvecAIC(2)
scalar kstar=matrixAIC(!indexminAIC,1)

show result
```
You just need to download the file as a program file [here](files/private/fourier%20ardl%20eviews%20code.prg), or copy and paste the above code into a new program file in EViews: `File > New > Program`.

The code above finds the value of the frequency, $k^*$, that minimizes the Akaike Information Criterion (AIC) (you can use any other criteria of your choice `@schwarz` or `@hq`). 

In the code above, you will need to change `GDPG` to your dependent variable, and `LOILPBRENT CC CCOILPBRENT AGRGDP UNEMP LINTSEC` to your set of independent variables. Also, you can adjust the maximum lag of the dependent and independent variables by adjusting `deplags` and `reglags`, respectively.  

To understand how this code generates the values of the frequency, read [this blog post](https://olayeniolaolu.blogspot.com/2021/12/fractional-frequency-flexible-fourier.html) by Professor Olayeni Olaolu Richard of the Obafemi Awolowo University, Nigeria. 


# The estimation and results
As mentioned above, to implement the ARDL bounds testing with a fourier function, all you need to do is input your dependent and independent variables and/or adjust the maximum lags. As shown in the image below, click on the `Run` tab, select the `Quick (fast)` radio button, and then `Ok`. It should take a few minutes (the code will run 391 regressions). 
![image](https://github.com/SmallJosePhD/smalljosephd.github.io/assets/104403529/0748cc2a-298b-4442-af2a-77de2d35a12e)

When the process is completed, you should see a scalar object named `kstar` and a `result` equation object (in fact, after completing the process, the equation object will be on the screen) in the workfile. If the `result` equation object is not open, open it and then adjust the `fixed regressor` field: replace `3.99999999999996` to `kstar`, then ok. See below image:

![image](https://github.com/SmallJosePhD/smalljosephd.github.io/assets/104403529/4441ef38-7784-439a-92d8-a7ca2d119d1f)

Below is the dynamic short-run result:
![image](https://github.com/SmallJosePhD/smalljosephd.github.io/assets/104403529/9dcdc19f-73e6-4da4-bcfe-e55e2b625774)


To conduct an augmented/Bootstrap ARDL, install the [augmented ARDL EViews Addin](/files/private/AugARDL.rar), and follow the usual approach: `Proc`> `Augmented ARDL Bounds Test`.


That's all!!!!
