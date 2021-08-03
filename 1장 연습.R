C(1,2,3,4,5)
rep(1:2,3)
seq(1)
pain<- c(0,3,2,2,1)
fpain <- factor(pain, levels=0:3)
levels(fpain) <- c("none", "mild", "medium", "severe")
3+5
5-3
mean(pain)
sd(pain)
Pnorm(3,4,3)
3 = a
cos(100)
sin(100)
rep(1:4,5)
rep(100:120,2)
c(2,4,3,8.5)
happy <- c(1,3,2,3)
whyhappy <- whyhappy(happy, levels = 0:2)
whyhappy = c(3,4,5)
whyhappy <- whyhappy(happy, levels = 0:2)
c(4,8,9) = b
pain + 
  48
rep(100:130,5)
3
3+4
hello
"hello"
1/3
1<3
2>4
2<4
3 = 3
3 == 3
x <- 4
x
x + 3
sandy <- 1, 3, 5, 7
"sandy" <- 1, 3, 5, 7
sandy <- 1 3 5 7 
sandy <- 13
sandy + 5 
sandy == 7
x <- x + 1
x
x = x + 1
x
y <- -4
abs(y)
help(rnorm)
my_random_numbers <- rnorm(5, mean=100, sd=15)
my_random_numbers
rnorm(5)y_
my_vector <- c(4, 5, 6)
my_vector
my_vector [2]
my_vector [3]
my_vector [2:3]
my_vector [3] <- 7 
my_vector
my_vector <- c(4, 5, 6)
my_vector_times_ten <- my_vector * 10
my_vector_times_ten
my first_vector <- c(1, 2, 3)
my_second_vector <- c(10, 20, 30)
my_first_vector <- c(1, 2, 3)
my_first_vector + my_second_vector
vector_a <- c(1, 2, 3)
vector_b <- c(1, 2, 4)
vector_a == vector_b
my_angle_values <- c(0, 1, 2)
my_sin_values <- sin(my_angle_values)
my_sin_values

"Data frame 연습"
car_model <- c("Ford Fusion", "Hyundai" "Toyota Corolla")
car_price <- c(25000, 16000, 18000)
car_mileage <- c(27, 36, 32)
cars_df <- data.frame(model=car_model, price=car_price, mileage=car_mileage)
car_model <- c("Ford fusion", "Hyndai", "Toyota")
cars_df <- data.frame(car_model, car_price, car_mileage)
view(cars_df)
View(cars_df)


"오류 주의. "" 이렇게 연속으로 붙이는 실수 시 Error: unexpected string constant가 나오게 됨"

View(cars_df)
view(cars_df) "view사용시 v 가 대문자여야"

cars_df$car_mileage
cars_df$car_mileage [3]

"패키지 설치하기"
> install.packages("ggplot2")
trying URL 'https://cran.rstudio.com/...
Content type 'application/x-gzip' length 3961383 bytes (3.8 MB)
==================================================
downloaded 3.8 MB


The downloaded binary packages are in
    /var/folders/.../downloaded_packages

install.packages("ggplot2")
    


library(ggplot2)

url < 'https://raw.githubusercontent.com/psych10/
  psych10/master/notebooks/Session03-IntroToR/gdp.csv'
  
gdp_df <- read.csv(url)
    
    
gdp_df <- read.csv('https://raw.githubusercontent.com/psych10/ psych10/master/notebooks/Session03-IntroToR/gdp.csv')    

gdp_df <- read.csv("https://raw.githubusercontent.com/psych10/psych10/master/notebooks/Session03-IntroToR/gdp.csv")    

View(gdp_df)

exchange_rate <- 0.9    
gdp_df$GDP_euros <- gdp_df$GDP * exchange_rate    

"새로 저장"
write.table(gdp_df, file = 'gdp_euro.csv'')

getwd()    