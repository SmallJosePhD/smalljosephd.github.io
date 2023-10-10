## Re-Evaluating Health Information Needs in Africa during COVID-19


### Short Summary:

In this project, we want to retrieve all English tweets from sub-Sahara Africa related to the treatment of COVID to understand local remedies for treating COVID.
Subsequently, we will search these remedies on Google to assess the reliability of these solutions and particularly if there are any responses from the national health authorities in this regard.

&nbsp;

#### **Data Sources**

  - Twitter
  
  - Google Search Trends
  
  - Google Search Results
  
  &nbsp;


#### **How to replicate the analysis**

-   Download the analysis pack *[see structure below]*

    **.**

    **├── Data**
    
    │ ├── tweets.csv
    
    │ ├── tweets.Rdata
    
    │ ├── tweets.xlsx

    │ └── sTrends.csv

    │ └── sTrends.Rdata

    │ └── sTrends.xlsx


    **├── Output**

    │ └── ...

    **├── R**

    │ ├── 00_master.R

    │ ├── 01_packages_install.R

    │ ├── 02_data_fetch_twitter.R

    │ └── 03_wrangling.R

    │ └── 04_google_trends.R

    │ └── 05_text_analysis.R

    ├── README.md

    └── CoTreat.Rproj

-   Using RStudio open "CoTreat.Rproj" file in the main project directory.

-   Run the master file in "R/00_master.R".

    The analysis is split into xxx parts, which is reflected in the structure of R scripts.

    -   Step 1: Installation of Packages -------------------

        `source ("R/01_packages_install.R")`

    -   Step 2: Fetch data from Twitter ---------------------
       `source ("R/02_data_fetch.R")`

    -   Step 3: Data Cleaning/Wrangling ---------------------
        `source ("R/03_wrangling.R")`

    -   Step 4: Google Trends ---------------------
        `source ("R/04_google_trends.R")`

    -   Step 5: Text Analysis and visualisation of the clean(ed) data (Tweets)
        `source ("R/05_text_analysis.R")`


-   Outputs from the exploratory analysis, graphs and models are saved in the [output folder](Output/).

&nbsp;


#### **Help:** *How to commit large files*

- Download the version that matches your device’s OS [here](https://git-lfs.github.com/). 

- Set up Git LFS for your account by running `git lfs install`

- Select the file types that you want Git LFS to manage using the command `git lfs track "*.file extension or filename"`. That is, `git lfs track "*.Rdata"` for Rdata files. This will create a *`.gitattributes`* file.

- Add the .gitattributes file staging area using the command `git add .gitattributes`.

- Commit and push just as you normally would. 

#### **Help:** *How to contribute*

- Fork the main repository

- Clone the forked repository

- Make changes to the cloned repository.

- Create a pull request on the main repository using the compare across forks option.

- Notify a team member about changes made.

- Once pull request has been successfully merged, update the cloned repository.

- Pull in Rstudio.

