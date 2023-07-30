#  First ML Project

This project consists in an application of one of the basic models of Machine Learning **(Polynomial Regression)** and Time-Series Analysis **(ARIMA)** in a real life problem. Choosing the Internet Penetration Rate as the main feature of the analysis and by looking at its major influencing factors, GDP and Urbanization Rate we can get a sense of how the technological advancement will look like in the following years. 

## Intuition

### Step 1: Settling on an underlying problem :thinking:

-> The different factors that impacted the unequal development/advancement of technology by looking at the Global Internet Penetration Rate and other relevant socio-economic coefficients, such as GDP and Urbanization Rate.


### Step 2: Work environment :computer:
  - Excel for the display of various data from multiple sources
  - Jupyter Notebook for data preprocessing and visualization, implementing the ML algorithms
  - R for evaluating model performance
  - Libraries used: Pandas, Numpy, Matplotlib, Sklearn, Statsmodels


### Step 3: Gathering and preprocessing the data :bar_chart:

  The datasets for every coefficient were gathered from data.worldbank.org. The next step was to merge all three datasets into a single one. Initially, it included almost 300 observations for every country on the globe, but to be more efficient I narrowed it down to only 11 countries from all continents and rearranged it into a panel dataset.

-> All datasets were gathered from https://data.worldbank.org

1. Internet Penetration Rate: https://data.worldbank.org/indicator/IT.NET.USER.ZS
2. GDP Growth Dataset: https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG
3. GDP Dataset: https://data.worldbank.org/indicator/NY.GDP.MKTP.CD
4. Urbanization Rate Dataset: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS


### Step 4: Exploratory Analysis for the 2 target countries :earth_asia:

Moving forward from the Data Cleaning & Preprocessing part in which I have gathered the factors that describe best the current state of the technological advancement, I chose Romania as target country and South Korea as the comparison country. The objective is to observe and analyze which factors contributed to an unequal advancement and visualize the results more easily by plotting the indicators side by side using subplots. Also I found out that Corellation Heatmaps offer valuable insight on how the "activity" of each coefficient.

By looking at each individual plot I concluded that the evolution of the Internet Penetration Rate and the GDP and Urbanization Rate variables followed a somewhat similar pattern, with a skyrocket growth from 2014 up to 2018-2019, followed by a drastical decline in 2020, due to the economic crysis that took the world by assault, or better said by COVID, followed by a recovery in 2021. 

Nevertheless, these aspects do not underline the inequality of technological progress between the two countries. Without delving too deep into history of the economies of each country we can still see some differences. Romania in the past two decades recovered with small steps from a political regime that affected all the following economic activities, impacting the most industries such as Heavy Industry, Agriculture, State-Owned Enterprises and IT.  

The most significant aspect differentiating South Korea from Romania in technological advancement is South Korea's rapid embrace of market-oriented policies and investments in innovation after transitioning from a agrarian country with a traditional economy, whereas Romania's history of communism and centrally planned economy hindered its technological progress and development.


### Step 5: Implementing the ML Models :chart_with_upwards_trend:

Because the format of the data is auto-regressive time-series I used the **ARIMA** Model in order to predict the Internet Penetration Rate individually and **Polynomial Regression** to predict the Internet Penetration Rate based on the GDP per Capita, GDP Growth Rate % and Urbanization Rate %.

- **ARIMA**: predict the Internet Penetration Rate and the GDP and Urbanization Rate features individually
    1. Determine the parameters (**p,d,q**) of the ARIMA Model
    2. For the **q** parameter (number of moving-average terms) we plot the Autocorrelation and Partial Autocorrelation
    3. For the **p** parameter (number of autoregressive terms) we plot the 1st Order and 2nd Order Differencing
    4. For the **d** parameter (number of nonseasonal differencing) we perform the Augmented Dickey-Fuller test for stationarity
    5. We build the ARIMA Model with an order of (p,d,q) that we determined by looking at the plots
    6.	We use the **forecast** method in order to make future predictions
    7.	We plot the predictions 


- **Polynomial Regression**: predict the Internet Penetration Rate % based on the GDP and Urbanization Rate features
  1.	We create the features of our standard model ( **Year** as X & **Internet Penetration Rate** as y)
  2.	We fit the Linear Regression to X and y variables
  3.	We create the Polynomial Regressor with a chosen degree of 4
  4.	We create **X_poly** as the transformation of the matrix of features X into the matrix of features X_poly by adding the additional coefficients polynomial terms into the matrix X by the value of the degree
  5.	We fit the Polynomial Regression to X_poly and y
  6.	We visualize the Polynomial Regression for both Romania and South Korea using subplots
  7.	We build the 1st and 2nd models using a combination of all available features  (the 1st model uses **GDP Per Capita** and **Urbanization Rate** and the 2nd model consists of **all three coefficients**)
  8.	For each model we fit the Polynomial Regression again to our chosen exogenous variables
  9.	We create test data for each variable in X, in order to perform the forecast, using random values for years 2019-2021 and for years 2022-2024 we use predictions from the ARIMA Model
  10.	We create X_poly using the transform method for all years: 2019-2024
  11.	Then we use the **predict** method that takes X_poly as parameter and we print the resulting values

 
:exclamation: In the **Polynomial Regression** implementation, for academic purposes in both the first and the second model I used the ARIMA predictions for years 2022-2024 when creating the Test sets and in the model evaluation for the actual values of the Internet Penetration Rate.


### Step 6: Model Evaluation :ok:

In order to perform the Model Evaluation we need to provide the actual values of the Internet Penetration Rate ( the y variable), but because the data is limited up to 2021 I used the predictions of the ARIMA Model for years 2022-2024.

Testing the model performance in R showed strong correlation and relevance between the independent variables and the dependent variable.

As for the evaluation methods, in Jupyter Notebook I used the most relevant ones for our case: **R-squared, Mean Absolute Error (MAE) , Mean Squared Error (MSE) and Root Mean Squared Error (RMSE)**.

Between the two, the most accurate model, when looking at the prediction results of the Polynomial Regression and the previous results of the ARIMA Model, is the 1st model, containing the GDP per Capita and Urbanization Rate as exogenous variables.

#### 1st Model evaluation metrics: 

**Model Accuracy 2019-2021**: **0.8185**

Mean Absolute Error (MAE): **1.5315**

Mean Squared Error (MSE): **2.984**

Root Mean Squared Error (RMSE): **1.727**

**Model Accuracy 2022-2024**: **0.9626**

Mean Absolute Error (MAE): **0.57**

Mean Squared Error (MSE): **0.5447**

Root Mean Squared Error (RMSE): **0.738**

Overall, the metrics suggest that the 1st Model provides reasonably accurate predictions for both the years 2019-2021 and 2022-2024, with high R-squared values indicating a good fit between the model and the observed data and relatively low error scores.

### Step 7: Conclusion :white_check_mark:

This project applied the basic models of Polynomial Regression and Time-Series Analysis (ARIMA) to explore the factors influencing technological advancement, with a focus on Internet Penetration Rate, GDP, and Urbanization Rate. 

By comparing Romania and South Korea, it was evident that historical factors, such as Romania's past communism and centrally planned economy, significantly impacted its technological progress. On the other hand, South Korea's rapid embrace of market-oriented policies and investments in innovation propelled its technological advancement. These factual information we can infer from the analysis of the GDP Growth Rate, GDP per Capita and Urbanization Rate, highly relevant socio-economic factors.

The implementation of ARIMA and Polynomial Regression models provided valuable insights and reasonably accurate predictions for the Internet Penetration Rate in both countries, shedding light on their technological trajectory in the coming years.

### Future Work :bulb:

To enhance the analysis, my future plans include incorporating additional features into the model and implementing more advanced prediction algorithms like Neural Networks or SARIMA/SARIMAX. As I am currently in the early stages of my Machine Learning journey, I aim to explore and leverage these techniques to improve the accuracy and depth of the predictions.


### References

These following sources and materials helped me gain a better understanding of Time-Series Analysis and prediction algorithms: 

Building the ARIMA Model:

 - https://www.projectpro.io/article/how-to-build-arima-model-in-python/544
 
 - https://towardsdatascience.com/machine-learning-part-19-time-series-and-autoregressive-integrated-moving-average-model-arima-c1005347b0d7
 
 - https://machinelearningmastery.com/arima-for-time-series-forecasting-with-python/
 
 - https://www.justintodata.com/arima-models-in-python-time-series-prediction/

Bulding the Polynomial Regression: 

In order to implement the Polynomial Regression I relied mostly on the knowledge and resources provided from the "Machine-Learning A-Z in Python & R" course on Udemy, taught by Kirill Eremenko and Hadelin de Ponteves.

 

