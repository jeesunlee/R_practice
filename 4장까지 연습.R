library(tidyverse)
library(cowplot)
library(knitr)
set.seed(123456)
opts_chunk$set(tidy.opts=list(width.cutoff=80))
options(tibble.width = 60)

# install을 먼저 해야해. 

install.packages("tidyverse")
install.packages("cowplot")
install.packages("knitr")
set.seed(123456)
opts_chunk$set(tidy.opts=list(width.cutoff=80)) 
options(tibble.width = 60)

library(NHANES)
rm('NHANES')
library(NHANES) 

library("tidyverse")
library("cowplot")
library("knitr")
set.seed(123456)
opts_chunk$set(tidy.opts=list(width.cutoff=80))
options(tibble.width = 60)

rm('NHANES')
library(NHANES)
install.packages("NHANES")
library("NHANES")
library(NHANES)
dim(NHANES)

n <- c("russ", "lucy", "jaclyn", "tyler")
x <- c(1, 2, 3, 4)
y <- c(4, 5, 6, 7)
z <- c(7, 8, 9, 10)

my_data_frame <- 
  tibble( 
    n, 
    x,
    y,
    z
    )

# 변수 정의 했으니 다시 불러봐야 

my_data_frame
glimpse(my_data_frame)

my_data_frame$x
my_data_frame[1,2]
my_data_frame[2,3]

my_data_frame[1, ]
my_data_frame[ ,1]

my_data_frame %>%
  slice(1:2)

my_data_frame_slice <- my_data_frame %>%
  slice(1:2)

my_data_frame_slice

my_data_frame %>%
  filter(n == "russ" | n == "lucy")


my_data_frame %>%
  select(x:y)

tiffany_data_frame <-
  tibble(
    n = "tiffany",
    x = 13,
    y = 14,
    z = 15
  )

my_data_frame %>%
  bind_rows(tiffany_data_frame)

toy_df <- data.frame(x = c(1, 2, 3, 4))
toy_df
glimpse(toy_df)

toy_df <- toy_df %>%
  mutate(y = x * 10)
toy_df
glimpse(toy_df)

toy_df2 <- toy_df %>%
  mutate(y = y + 1)
toy_df2
glimpse(toy_df2)


my_data_frame <- 
  my_data_frame %>%
  mutate(total = x + y + z)

my_data_frame

kable(my_data_frame)

my_data_frame <- 
  my_data_frame %>%
  select(-total)

my_data_frame

kable(my_data_frame)

nrow(NHANES)

unique(NHANES$ID)

length(unique(NHANES$ID))

NHANES_unique <- 
  NHANES %>%
  distinct(ID, .keep_all = TRUE)

"중복된 데이터 삭제 후 확인"

nrow(NHANES)
nrow(NHANES_unique)

NHANES %>%
  pull(PhysActive) %>%
  head(10) %>%
  kable
      

NHANES %>%
  mutate(PhysActive = fct_explicit_na(PhysActive)) %>%
  pull(PhysActive) %>%
  head(10) %>%
  kable () 


PhysActive_table <- NHANES_unique %>%
  mutate(PhysActive = fct_explicit_na(PhysActive)) %>%
  dplyr::select(PhysActive) %>%
  group_by(PhysActive) %>%
  summarize(AbsoluteFrequency = n())

kable(PhysActive_table)

PhysActive_table

NHANES_unique %>%
  mutate(PhysActive = fct_explicit_na(PhysActive)) %>%
  dplyr::select(PhysActive) %>%
  group_by(PhysActive) %>%
  summarize(AbsoluteFrequency = n()) %>%
  kable()

PhysActive_table <- PhysActive_table %>%
  mutate(
    Percentage = AbsoluteFrequency /
      sum(AbsoluteFrequency) * 100
  )

kable(PhysActive_table, digits=2)


NHANES

SleepHrsNight_cumulative <- 
  NHANES_unique %>%
  drop_na(SleepHrsNight) %>%
  dplyr::select(SleepHrsNight) %>%
  group_by(SleepHrsNight) %>%
  summarize(AbsoluteFrequency = n ()) %>%
  mutate(
    RelativeFrequency = AbsoluteFrequency /
      sum(AbsoluteFrequency), 
    CumulativeDensity = cumsum(RelativeFrequency)
  )
kable(SleepHrsNight_cumulative)

attitudeData_file <- read_tsv("https://raw.githubusercontent.com/statsthinking21/statsthinking21-R/master/data/statsAttitude.txt")

nQuestions <- 29

attitudeData_file

attitudeData_file <- 
  attitudeData_file %>%
  rename(
    year = 1,
    StatsBefore = 2
  ) %>% 
  rename_at(
    vars(-Year, -StatsBefore),
    list(name = ~paste()('ats', 1:nQuestions))
  )


library(tidyverse)

theme_set(theme_bw())

ggplot(mpg, aes(hwy)) + 
  geom_histogram(bins = nclass.FD(mpg$hwy)) + 
  xlab('Highway mileage')

ggplot(mpg, aes(hwy)) +
  geom_density() +
  xlab('Highway mileage')

ggplot(mpg, aes(hwy)) +
  geom_bar(stat = "count")

ggplot(mpg, aes(hwy)) +
  geom_line(stat = "density")


ggplot(mpg, aes(manufacturer, hwy)) +
  geom_bar(stat = "summary", fun.y = "mean") + 
  ylab('Highway mileage')
  
ggplot(mpg) +
  geom_bar(aes(x = manufacturer)) 
# increase the width and save the plot 
ggsave("ggplot_with_overlapping_axis_text_wide.png", width=12)

ggplot(mpg) +
  geom_bar(aes(x = manufacturer)) + 
  coord_flip()
ggsave("ggplot_horizontal_plot_with_coord_flip.png")

mpg$year <- factor(mpg$year)

ggplot(mpg, aes(manufacturer, hwy, fill = year)) + 
  geom_bar(stat = "summary", fun.y = "mean")
 
ggplot(mpg, aes(manufacturer, hwy, fill = year)) +
  geom_bar(stat = "summary",
           fun.y = "mean",
           position = "dodge")

ggplot(mpg, aes(year, hwy, 
                group=manufacturer, 
                color=manufacturer)) +
  geom_line(stat = "summary", fun.y = "mean")

ggplot(mpg, aes(manufacturer, hwy)) +
  facet_grid(year ~ .) +
  geom_bar(stat = "summary",
           fun.y = "mean")

ggplot(mpg, aes(manufacturer, hwy)) +
  geom_boxplot()

mpg_summary <- mpg %>%
  group_by(manufacturer) %>%
  summarise(n = n(),
            mean_hwy = mean(hwy),
            sd_hwy = sd(hwy))

limits <- aes(
  ymin = mean_hwy - 1.96 * sd_hwy / sqrt(n), 
  ymax = mean_hwy + 1.96 * sd_hwy / sqrt(n)
  )

ggplot(mpg_summary, aes(manufacturer, mean_hwy)) + 
  geom_bar(stat = "identity") + 
  geom_errorbar(limits, width=0.5)


ggplot(mpg_summary, aes(manufacturer, mean_hwy)) +
  geom_point() + 
  geom_errorbar(limits, width = 0.5)

ggplot(mpg_summary, aes(manufacturer, mean_hwy)) +
  geom_point() + 
  geom_errorbar(limits, width = 0)

mpg_summary_ordered <- mpg_summary %>%
  mutate(
    manufacturer = reorder(manufacturer, -mean_hwy)
  )

ggplot(mpg_summary_ordered, aes(manufacturer, mean_hwy)) +
  geom_point() +
  geom_errorbar(limits, width = 0)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() 

library(tidyverse)

theme_set(theme_bw())

ggplot(mpg, aes(hwy)) + 
  geom_histogram(bins = nclass.FD(mpg$hwy)) + 
  xlab('Highway mileage')

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() 

ggplot(mpg, aes(displ, hwy)) +
  geom_point() + 
  geom_smooth(color = "red") +
  geom_point(aes(displ, cty), color = "limegreen") +
  geom_smooth(aes(displ, cty), color = "limegreen")

oringDF <- read.table("data/orings.csv", sep = ",",
                      header = TRUE) 
