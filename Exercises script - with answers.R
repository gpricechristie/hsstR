################################################################################
############################### Fundamentals ###################################
################################################################################

# Exercises 1

# 1) Execute the following code to become familiar with R operators 

# Addition
5 + 5

# Subtraction
5 - 3

# Multiplication
2 * 8

# Division
10 / 3

### Relational Operators ###

# Less than
5 < 3

# Less than or equal to
3 <= 3

# More than
5 < 3

# More than or equal to
3 >= 3

# Equal to
2 == 3 

# Not equal to
2 != 3

### Logical Operators ###

# AND
5 < 2 & 5 < 3

# OR
5 < 2 | 5 < 3

# 2) Assign a number to a variable. Call this variable x. Tip: use <- to assign a variable.

x <- 5

# 3) Assign a number to a second variable call this variable y.

y <- 3

# 4) Type x in to console and press enter. This will show the value of x.
# Repeat with y. This will work for any furture variable.

x
y


# 5) Try addition, subtraction, multiplication and division of these two variables.

x + y
x - y
x * y
x / y

# 6) Try comparing whether x is more than y.

x > y

# 7) Create a vector containing numbers and assign it to a variable called v1
# Tip: Create vectors with the following syntax: c(1, 2, 3) and assign to a
# variable as in question 2/3.

v1 <- c(1, 2, 3)

# 8) We will now use a function to add all elements your vector. Execute the code given.

sum(v1)

# Bonus #
# 9) Now try using more functions on your vector. e.g. mean(), median() and range() 

mean(v1)
median(v1)
range(v1)

################################################################################
########################### Data Exploration ###################################
################################################################################

### Exercises 2 ####

# 1) Execute the following to read in your data and assign to a variable.

df <- read.csv('workshop-open-data.csv')

# 2) Use nrow() to view number of rows in dataframe.

nrow(df)

# 3) View the first few rows of you data using head()

head(df)

# 4) View the names of the columns using colnames()

colnames(df)

# 5) Use View() with your data to see a user friendly version of your dataframe.
# Tip: This can also be achieved by double clicking on df in enviroment.

View(df)

# 6) Select the a single column from the table. Tip: Use $ like so: df$age

df$age

# 7) Try summary() on the data and inspect the output.

summary(df)

# Bonus # 
# 8) Select columns of your choice and summaries using functions you've learnt
# Tip see previous bonus question. 

mean(df$age)
median(df$age)
range(df$age)

################################################################################
###################### Part 3: Data Visualisation ##############################
################################################################################

# Run the following code to get setup for the next section.

### GGPlot Introduction & Setup: ###
library(ggplot2)

### Basic Structure of GGPlot ###

my_plot1 <- ggplot(df, aes(x = age, y = bmi))

#######

my_plot1

#######

my_plot1 + 
  geom_point()

#######

my_plot1 +
  geom_point(aes(colour = stroke))

#######

my_plot1 + 
  geom_point(aes(colour = stroke)) +
  scale_colour_manual(values = c("FALSE" = "Light Blue",
                                 "TRUE" = "Black"))

#######

my_plot2 <- my_plot1 + 
  geom_point(aes(colour = stroke)) +
  scale_colour_manual(values = c("FALSE" = "Light Blue",
                                 "TRUE" = "Black")) +
  labs(
    title = "Main Title",
    y = "BMI",
    x = "Age (Years)"
  ) +
  theme_bw()

my_plot2

#######

### Exercise 3.1 ###
# What is the distribution of age for men and women? 

# 1) Start with the base ggplot() function

# 2) Map data = df into ggplot()

# 3) Map x = age in the aes() function

# 4) Add + geom_histogram() 

# 5) Add aes(fill=gender) to geom_histogram()

# 6) Add a + facet_wrap(~gender) function


### Exercise 3.1 Answer ###
ggplot(df, aes(x = age)) +
  geom_histogram(aes(fill = gender)) + 
  facet_wrap(~gender)

# How else can we compare the spread of these groups? 

ggplot(df, aes(x = gender, y = age)) + 
  geom_boxplot(aes(fill = gender)) + 
  labs(title = "Boxplot of Age and Gender",
       x = "Gender",
       y = "Age") +
  theme_classic()

################################################################################
######################### Part 4: Statistical Tests ############################
################################################################################

### Exercise 4.1 ###
# Is there a difference in median age between the men and women? 

# 1) Use the function wilcox.test(y ~ x, data = df, paired = FALSE) 
#    to perform a Mann-Whitney U Test. Map y = age and x = gender.

# 2) Look at the output and identify any relevant information in it.


### Exercise 4.1 Answer ###

wilcox.test(age ~ gender, data = df, paired = FALSE)

######


### Simple Linear Regression ###

my_plot2 +
  geom_smooth(method = lm) 

linearmodel <- lm(formula = bmi ~ age, 
                  data = df)

summary(linearmodel)

