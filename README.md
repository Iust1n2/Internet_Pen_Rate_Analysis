#  First ML Project

This project consists in an application of one of the basic models of Machine Learning **(Polynomial Regression)** and Time-Series Analysis **(ARIMA)** in a real life problem. Choosing the Internet Penetration Rate as the main feature of the analysis and by looking at its major influencing factors, GDP and Urbanization Rate we can get a sense of how the technological advancement will look like in the following years. 

## Intuition

### Step 1: Settling on an underlying problem :thinking:

-> The different factors that affected the unequal advancement of technology by looking at the Internet Penetration Rate and other relevant socio-economic coefficients, such as GDP and Urbanization Rate.


### Step 2: Work environment :computer:
  - Excel for the display of various data from multiple sources
  - Jupyter Notebook for data preprocessing and visualization, implementing the ML algorithms
  - Libraries used: Pandas, Numpy, Matplotlib, Sklearn, Statsmodels, Seaborn


### Step 3: Gathering and preprocessing the data :bar_chart:

  The datasets for every coefficient were gathered from data.worldbank.org. The next step was to merge all three datasets into a single one. Initially, it included almost 300 observations for every country on the globe, but to be more efficient I narrowed it down to only 11 countries from all continents and rearranged it into a panel dataset.

-> All datasets were gathered from https://data.worldbank.org

1. Internet Penetration Rate: https://data.worldbank.org/indicator/IT.NET.USER.ZS
2. GDP Growth Dataset: https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG
3. GDP per Capita Dataset: https://data.worldbank.org/indicator/NY.GDP.PCAP.KN?end=2022&start=1960
4. GDP per Capita for South Korea: https://www.macrotrends.net/countries/KOR/south-korea/gdp-per-capita
5. Urbanization Rate Dataset: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS


### Step 4: Exploratory Analysis for the 2 target countries :earth_asia:

Moving forward from the Data Cleaning & Preprocessing part in which I have gathered the factors that describe best the current state of the technological advancement, I chose Romania as target country and South Korea as the comparison country. The objective is to observe and analyze which factors contributed to an unequal advancement and visualize the results more easily by plotting the indicators side by side using subplots. Also, I found out that Corellation Heatmaps offer valuable insight on the "activity" of each coefficient.

By looking at each individual plot I concluded that the evolution of the Internet Penetration Rate and the GDP and Urbanization Rate variables followed a somewhat similar pattern, with a skyrocket growth from 2014 up to 2018-2019, followed by a drastical decline in 2020, due to the economic crysis that took the world by assault, or better said by COVID, followed by a recovery in 2021. 

Nevertheless, these aspects are merely an indication of economic growth and do not fully underline the inequality of technological progress between the two countries. Without delving too deep into the history of the economies of each country we can still see some differences. Romania in the past two decades recovered with small steps from a political regime that affected almost every economic sector.

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


- **Polynomial Regression**: predict the Internet Penetration Rate % for 2 models (1st containing the **Year** as independent variable & the 2nd containing **Year and GDP per capita** as independent variables)
  1.	Declare the variables of the model as X and y
  2.	Perform train/test split with a rate of 0.2 
  3.	Create the polynomial features with a **poly degree of 2** and declare **X_train_poly and X_test_poly**
  4.	**Fit** the polynomial regression model to **X_train_poly and y_train**
  5.	Make **future predictions** for years 2022-2024 and also provide predictions for years 2019-2021 in order to verify accuracy
  6.	Visualize the Polynomial Regression results 
  7.	Print the predictions
  8.	Perform Model Evaluation with metrics such as **R-squared, MAE,  MSE, RMSE** on Training Data
  9.	Perform Model Evaluation on Test Data


:exclamation: In the **Polynomial Regression** implementation, for academic purposes in the 2nd model I used the ARIMA predictions for years 2022-2024 when creating the Test data for the GDP per capita.


### Step 6: Model Evaluation :ok:

Testing the model performance in R showed strong correlation and relevance between the independent variables and the dependent variable.

As for the evaluation methods, in Jupyter Notebook I used the most relevant ones for our case: **R-squared, Mean Absolute Error (MAE) , Mean Squared Error (MSE) and Root Mean Squared Error (RMSE)**.

Both models performed well, providing really close predictions to one-another with a high accuracy and relatively low error scores: 

#### 1st Model evaluation metrics: 

**Model Accuracy on Training Data**: **1.00**

Mean Absolute Error (MAE) (Training): **0.92**

Mean Squared Error (MSE) (Training): **1.11**

Root Mean Squared Error (RMSE) (Training): **1.05**

**Model Accuracy on Test Data**: **0.99**

Mean Absolute Error (MAE) (Test): **1.12**

Mean Squared Error (MSE) (Test): **1.55**

Root Mean Squared Error (RMSE) (Test): **1.24**


#### 2nd Model evaluation metrics: 

**Model Accuracy on Training Data**: **1.00**

Mean Absolute Error (MAE) (Training): **0.78**

Mean Squared Error (MSE) (Training): **0.77**

Root Mean Squared Error (RMSE) (Training): **0.88**

**Model Accuracy on Test Data**: **0.98**

Mean Absolute Error (MAE) (Test): **1.53**

Mean Squared Error (MSE) (Test): **2.56**

Root Mean Squared Error (RMSE) (Test): **1.60**


### Step 7: Conclusion :white_check_mark:

This project applied the basic models of Polynomial Regression and Time-Series Analysis (ARIMA) to explore the factors influencing technological advancement, with a focus on Internet Penetration Rate, GDP, and Urbanization Rate. 

By comparing Romania and South Korea, it was evident that historical factors, such as Romania's past communism and centrally planned economy, significantly impacted its technological progress. On the other hand, South Korea's rapid embrace of market-oriented policies and investments in innovation propelled its technological advancement. These factual information we can infer from the analysis of the GDP Growth Rate, GDP per Capita and Urbanization Rate, highly relevant socio-economic factors.

The implementation of ARIMA and Polynomial Regression models provided valuable insights and reasonably accurate predictions for the Internet Penetration Rate in Romania, shedding light on it's technological trajectory in the upcoming years.

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

Other resources: 

  - https://towardsdatascience.com/polynomial-regression-in-python-dd655a7d9f2b
  - https://aamir07.medium.com/polynomial-regression-with-k-fold-cross-validation-bc5275137546

 

