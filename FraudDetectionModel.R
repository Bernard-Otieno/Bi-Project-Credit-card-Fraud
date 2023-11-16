

# if (!is.element("renv", installed.packages()[, 1])) {
#   install.packages("renv", dependencies = TRUE) # nolint
# }
# require("renv") # nolint

# Select option 1 to restore the project from the lockfile
#renv::init() # nolint
#renv::update()
# Execute the following code to reinstall the specific package versions
# recorded in the lockfile (restart R after executing the command):
#renv::restore()

# If you get several errors setting up renv and you prefer not to use it, then
# you can deactivate it using the following command (restart R after executing
# the command):
#renv::deactivate()

.libPaths()

# One of the libraries should be a folder inside the project.

# Then execute the following command to see which packages are available in
# each library:
lapply(.libPaths(), list.files)

############################################################################################
###########################################################################################
#packages
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE)
}
require("readr")

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

if (!is.element("mlbench", installed.packages()[, 1])) {
  install.packages("mlbench", dependencies = TRUE)
}
require("mlbench")


#Loading dataset
library(readr)
data <- read_csv("data/data.csv")
#View(data)
dim(data)


#Identify the Data Types ----
sapply(data, class)

# Measures of Frequency ----
##Identify the number of instances that belong to each class.
data_freq <- data$isFraud
cbind(frequency = table(data_freq),
      percentage = prop.table(table(data_freq)) * 100)
# Measures of Central Tendency ----
##  Calculate the mode ----

data_amount_mode <- names(table(data$amount))[
  which(table(data$amount) == max(table(data$amount)))
]
print(data_amount_mode)
# Measures of Distribution/Dispersion/Spread/Scatter/Variability ----

## Measure the distribution of the data for each variable ----
summary(data)
##  Measure the standard deviation of each variable 

#sapply(data[, ,-2,-4,-7], sd)
sapply(data[, c(1, 3, 5, 6, 8, 9, 10, 11)], sd)
#sapply(data[, 11], sd)
### Measure the variance of each variable ----
sapply(data[, c(1, 3, 5, 6, 8, 9, 10, 11)], var)

#Measure the kurtosis of each variable

# In “type = 2” (used in SPSS and SAS):
# 1.	Kurtosis < 3 implies a low number of outliers
# 2.	Kurtosis = 3 implies a medium number of outliers
# 3.	Kurtosis > 3 implies a high number of outliers


if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

sapply(data[, c(1, 3, 5, 6, 8, 9, 10, 11)],  kurtosis, type = 2)

##Measure the skewness of each variable
# 1.	Skewness between -0.4 and 0.4 (inclusive) implies that there is no skew
# in the distribution of results; the distribution of results is symmetrical;
# it is a normal distribution; a Gaussian distribution.
# 2.	Skewness above 0.4 implies a positive skew; a right-skewed distribution.
# 3.	Skewness below -0.4 implies a negative skew; a left-skewed distribution.


sapply(data[, c(1, 3, 5, 6, 8, 9, 10, 11)],  skewness, type = 2)

#Measure the covariance between variables

data_cov <- cov(data[,
                     c(1, 3, 5, 6, 8, 9, 10, 11)])
View(data_cov)
#Measure the correlation between variables

data_cor <- cor(data[,
                     c(1, 3, 5, 6, 8, 9, 10, 11)])
View(data_cor)

# The additive two-way ANOVA
data_two_way_anova_orig <- aov(isFraud ~ # nolint
                           +oldbalanceOrg
                          +newbalanceOrig +amount,
                          data = data)
summary(data_two_way_anova_orig)

data_two_way_anova_dest <- aov(isFraud ~ # nolint
                                 +oldbalanceDest
                               +newbalanceDest +amount,
                               data = data)
summary(data_two_way_anova_dest)
###Create a Missingness Map to Identify Missing Data
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

missmap(data, col = c("red", "grey"), legend = TRUE)

if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")
corrplot(cor(data[,c(1, 3, 5, 6, 8, 9, 10, 11)]), method = "circle")


if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")
ggcorrplot(cor(data[,c(1, 3, 5, 6, 8, 9, 10, 11)]))




