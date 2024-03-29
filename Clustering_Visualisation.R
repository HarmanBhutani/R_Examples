library(cluster.datasets)
library(tidyverse)
library(gridExtra)

data(all.mammals.milk.1956)

all.mammals.milk.1956

plot1 <- all.mammals.milk.1956 %>% 

  ggplot(aes(x = name, y = water)) + 
  geom_jitter(width = .025, height = 0, size = 2, alpha = .5, color = "blue") +
  labs(x = "All Mammals", y="percentage of water")

plot1

plot2 <-  all.mammals.milk.1956 %>%
  ggplot(aes(x = name, y = protein)) + 
  geom_jitter(width = .02, height = 0, size = 2, alpha = .6,  color = "orange") +
  labs(x = "", y="percentage of protein")

plot3 <-  all.mammals.milk.1956 %>%
  ggplot(aes(x = name, y = fat)) + 
  geom_jitter(width = .02, height = 0, size = 2, alpha = .6,  color = "green") +
  labs(x = "", y="percentage of fat")

plot4 <-  all.mammals.milk.1956 %>%
  ggplot(aes(x = name, y = lactose)) + 
  geom_jitter(width = .02, height = 0, size = 2, alpha = .6,  color = "red") +
  labs(x = "", y="percentage of lactose")

plot5 <-  all.mammals.milk.1956 %>%
  ggplot(aes(x = name, y = ash)) + 
  geom_jitter(width = .02, height = 0, size = 2, alpha = .6,  color = "violet") +
  labs(x = "", y="percentage of ash")

grid.arrange(plot1, plot2, plot3, plot4, plot5)
