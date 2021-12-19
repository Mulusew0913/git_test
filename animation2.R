library(ggplot2)
library(gganimate)
theme_set(theme_bw())

library(gapminder)
head(gapminder)

p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p

library(datasauRus)
library(dplyr)
simpsons_paradox <- datasauRus::simpsons_paradox %>%
  filter(dataset == "simpson_2") %>%
  mutate(group = cut(x + y, c(0, 55, 80, 120, 145, 200), labels = LETTERS[1:5])) %>%
  select(- dataset)

x <- rbind(simpsons_paradox, simpsons_paradox, simpsons_paradox)
ggplot(data=x, aes(x=x,y=y, color=group)) + geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() + scale_size(range = c(20, 20))

lm(y ~ x + group, data = simpsons_paradox)
