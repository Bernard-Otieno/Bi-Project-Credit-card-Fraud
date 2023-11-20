

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
## dplyr - For data manipulation ----
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE,
  repos = "https://cloud.r-project.org")
}
require("dplyr")

## ggplot2 - For data visualizations using the Grammar for Graphics package ----
if (!is.element("ggplot2", installed.packages()[, 1])) {
install.packages("ggplot2", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("ggplot2")

## ggrepel - Additional options for the Grammar for Graphics package ----
if (!is.element("ggrepel", installed.packages()[, 1])) {
install.packages("ggrepel", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("ggrepel")

## ggraph - Additional options for the Grammar for Graphics package ----
if (!is.element("ggraph", installed.packages()[, 1])) {
install.packages("ggraph", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("ggraph")

## tidytext - For text mining ----
if (!is.element("tidytext", installed.packages()[, 1])) {
install.packages("tidytext", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("tidytext")

## tidyr - To tidy messy data ----
if (!is.element("tidyr", installed.packages()[, 1])) {
install.packages("tidyr", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("tidyr")

## widyr - To widen, process, and re-tidy a dataset ----
if (!is.element("widyr", installed.packages()[, 1])) {
install.packages("widyr", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("widyr")

## gridExtra - to arrange multiple grid-based plots on a page ----
if (!is.element("gridExtra", installed.packages()[, 1])) {
install.packages("gridExtra", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("gridExtra")

## knitr - for dynamic report generation ----
if (!is.element("knitr", installed.packages()[, 1])) {
install.packages("knitr", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("knitr")

## kableExtra - for nicely formatted output tables ----
if (!is.element("kableExtra", installed.packages()[, 1])) {
install.packages("kableExtra", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("kableExtra")

## formattable -  To create a formattable object ----
# A formattable object is an object to which a formatting function and related
# attributes are attached.
if (!is.element("formattable", installed.packages()[, 1])) {
install.packages("formattable", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("formattable")

## circlize - To create a cord diagram or visualization ----
# by Gu et al. (2014)
if (!is.element("circlize", installed.packages()[, 1])) {
install.packages("circlize", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("circlize")

## memery - For creating data analysis related memes ----
# The memery package generates internet memes that optionally include a
# superimposed inset plot and other atypical features, combining the visual
# impact of an attention-grabbing meme with graphic results of data analysis.
if (!is.element("memery", installed.packages()[, 1])) {
install.packages("memery", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("memery")

## magick - For image processing in R ----
if (!is.element("magick", installed.packages()[, 1])) {
install.packages("magick", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("magick")

## yarrr - To create a pirate plot ----
if (!is.element("yarrr", installed.packages()[, 1])) {
install.packages("yarrr", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("yarrr")

## radarchart - To create interactive radar charts using ChartJS ----
if (!is.element("radarchart", installed.packages()[, 1])) {
install.packages("radarchart", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("radarchart")

## igraph - To create ngram network diagrams ----
if (!is.element("igraph", installed.packages()[, 1])) {
install.packages("igraph", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("igraph")

## wordcloud2 - For creating wordcloud by using 'wordcloud2.JS ----
if (!is.element("wordcloud2", installed.packages()[, 1])) {
install.packages("wordcloud2", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("wordcloud2")

## readr - Load datasets from CSV files ----
if (!is.element("readr", installed.packages()[, 1])) {
install.packages("readr", dependencies = TRUE,
repos = "https://cloud.r-project.org")
}
require("readr")
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

boxplot(data[, 3], main = names(data)[3])

par(mfrow = c(5, 9))
for (i in 5:9) {
  boxplot(data[, i], main = names(data)[i])
}
payment_data_yield <- as.numeric(unlist(data[, 2]))
boxplot(payment_data_yield, main = names(data)[2])


#  Create a subset of the variables/features ----
data_subset<- data %>%
  select(step, type, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest,
         oldbalanceDest, newbalanceDest, isFraud, isFlaggedFraud)

### Subset of rows ----
# We then select 500 random observations to be included in the dataset
rand_ind <- sample(seq_len(nrow(data_subset)), 500)
data_rand <- data[rand_ind, ]


## Amelia ----
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("Amelia")
## MICE ----
# We use the MICE package to perform data imputation
if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("mice")


# Confirm the "missingness" in the Dataset before Imputation ----
# Are there missing values in the dataset?
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("naniar")
any_na(data_rand)

# How many?
n_miss(data_rand)

# What is the percentage of missing data in the entire dataset?
prop_miss(data_rand)*100
# How many missing values does each variable have?
data_rand %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(data_rand)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(data_rand)

# Which variables contain the most missing values?
gg_miss_var(data_rand)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(data_rand) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?
gg_miss_upset(data_rand)

## pROC ----
if (require("pROC")) {
  require("pROC")
} else {
  install.packages("pROC", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
## 1.c. Split the dataset ----
# Define a 75:25 train:test data split of the dataset.
# That is, 75% of the original data will be used to train the model and
# 25% of the original data will be used to test the model.
class(data)
# Convert isFraud to a factor with two levels
str(data_rand$isFraud)
data_rand$isFraud <- factor(data_rand$isFraud, levels = c(0, 1))

train_index <- createDataPartition(data_rand$isFraud,
                                   p = 0.75,
                                   list = FALSE)
data_train <- data_rand[train_index, ]
data_test <- data_rand[-train_index, ]

## 1.d. Train the Model ----
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)

# We then train a Generalized Linear Model to predict the value of Diabetes
# (whether the patient will test positive/negative for diabetes).

# `set.seed()` is a function that is used to specify a starting point for the
# random number generator to a specific value. This ensures that every time you
# run the same code, you will get the same "random" numbers.
set.seed(7)
data_model_glm <-
  train(isFraud ~ ., data = data_train, method = "glm",
        metric = "Accuracy", trControl = train_control)

## 1.e. Display the Model's Performance ----
### Option 1: Use the metric calculated by caret when training the model ----
# The results show an accuracy of approximately 77% (slightly above the baseline
# accuracy) and a Kappa of approximately 49%.
print(data_model_glm)





