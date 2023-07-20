#Multiple Linear Regression

# Fit the multiple linear regression to the first model
mul_lin_regression1 <- lm(IntPenRate ~ GDPPerCapita + GDPGrowth + UrbRate, data=romania_data)

# View the summary of the first model
summary(mul_lin_regression1)

#  Residuals:
#    1       2       3       4       5       6       7       8 
#  -0.4519 -0.6308  0.7822  0.3971  1.0163 -1.7212  0.4914  0.1169 
#
#  Coefficients:
#  Estimate Std. Error t value Pr(>|t|)   
#  (Intercept)  -1.392e+03  3.165e+02  -4.397  0.01172 * 
#  GDPPerCapita  2.906e-03  3.985e-04   7.292  0.00188 **
#  GDPGrowth    -2.561e-01  1.428e-01  -1.793  0.14738   
#  UrbRate       2.586e+01  5.994e+00   4.314  0.01251 * 
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#  Residual standard error: 1.186 on 4 degrees of freedom
#  Multiple R-squared:  0.9932,	Adjusted R-squared:  0.988 
#  F-statistic: 193.8 on 3 and 4 DF,  p-value: 8.735e-05

# Fit the polynomial regression to the second model
mul_lin_regression2 <- lm(IntPenRate ~ GDPPerCapita + UrbRate, data=romania_data)

# View the summary of the second model
summary(mul_lin_regression2)

#  Residuals:
#  1       2       3       4       5       6       7       8 
#  -0.8217 -0.5089  1.1005 -0.3454  0.9266 -1.3852  2.0280 -0.9938 

#  Coefficients:
#  Estimate Std. Error t value Pr(>|t|)   
#  (Intercept)  -1.643e+03  3.409e+02  -4.820  0.00480 **
#  GDPPerCapita  2.632e-03  4.422e-04   5.952  0.00191 **
#  UrbRate       3.060e+01  6.461e+00   4.736  0.00517 **
#   ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#  Residual standard error: 1.424 on 5 degrees of freedom
#  Multiple R-squared:  0.9877,	Adjusted R-squared:  0.9827 
#  F-statistic: 200.3 on 2 and 5 DF,  p-value: 1.687e-05

# Load the necessary library
library(dplyr)

# Create the dataset
dataset <- data.frame(
  Country = rep("Romania", 8),
  Year = 2014:2021,
  IntPenRate = c(54.08000, 55.76316, 59.50395, 63.74728, 70.68128, 73.65748, 78.45527, 83.59043),
  GDPPerCapita = c(18424.28, 19096.13, 19754.81, 21497.92, 22928.34, 23937.58, 23184.61, 24714.25),
  GDPGrowth = c(4.120675, 3.160504, 2.857546, 8.196507, 6.029019, 3.853164, -3.677511, 5.793255),
  UrbRate = c(53.900, 53.887, 53.900, 53.936, 53.998, 54.084, 54.194, 54.329)
)

# Fit the polynomial regression to the first model
poly_regression1 <- lm(IntPenRate ~ poly(GDPPerCapita, 2) + poly(GDPGrowth, 2) + poly(UrbRate, 2), data = dataset)

# View the summary of the first model
summary(poly_regression1)

#  Residuals:
#  1        2        3        4        5        6        7        8 
#  0.03030  0.24014 -0.30958 -0.32031  0.71965 -0.42934  0.04844  0.02071 
#
#  Coefficients:
#  Estimate Std. Error t value Pr(>|t|)   
#  (Intercept)             67.4349     0.3468 194.462  0.00327 **
#  poly(GDPPerCapita, 2)1  -7.7049    20.3719  -0.378  0.76981   
#  poly(GDPPerCapita, 2)2 -11.4744     7.5499  -1.520  0.37049   
#  poly(GDPGrowth, 2)1      6.2843     7.0442   0.892  0.53626   
#  poly(GDPGrowth, 2)2     -6.0468     5.0882  -1.188  0.44533   
#  poly(UrbRate, 2)1       41.1483    23.1777   1.775  0.32657   
#  poly(UrbRate, 2)2       -6.8538     6.7351  -1.018  0.49444   
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#  Residual standard error: 0.9808 on 1 degrees of freedom
#  Multiple R-squared:  0.9988,	Adjusted R-squared:  0.9918 
#  F-statistic: 142.4 on 6 and 1 DF,  p-value: 0.06406


# Fit the polynomial regression to the second model
poly_regression2 <- lm(IntPenRate ~ poly(GDPPerCapita, 2) + poly(UrbRate, 2), data = dataset)

# View the summary of the second model
summary(poly_regression2)

# Residuals:
#   1        2        3        4        5        6        7        8 
#  -0.08833 -0.20820  0.72753 -1.04288  1.00104 -0.42936  0.01114  0.02905 
#
#  Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#  (Intercept)             67.4349     0.3449 195.503 2.95e-07 ***
#  poly(GDPPerCapita, 2)1  11.2028     2.9300   3.823  0.03150 *  
#  poly(GDPPerCapita, 2)2  -3.3371     1.3742  -2.428  0.09346 .  
#  poly(UrbRate, 2)1       18.7887     2.9006   6.478  0.00747 ** 
#  poly(UrbRate, 2)2       -1.0517     1.4352  -0.733  0.51676    
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#  Residual standard error: 0.9756 on 3 degrees of freedom
#  Multiple R-squared:  0.9965,	Adjusted R-squared:  0.9919 
#  F-statistic: 215.4 on 4 and 3 DF,  p-value: 0.00051

