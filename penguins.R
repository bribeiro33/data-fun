# Barb Ribeiro p4
library(tidyverse)
library(palmerpenguins)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth() +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    color = "Species",
    shape = "Species"
  )

# 2.2.5.1: 
data(penguins)
cat("There are", nrow(penguins), "rows")
cat("There are", ncol(penguins),"columns")

# 2.2.5.2: 
?penguins
print("bill_depth_mm = a number denoting bill depth (millimeters)")

# 2.2.5.3
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm, y = bill_length_mm)
) + 
  geom_point()
print("No correlation")

# 2.2.5.4
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) + 
  geom_point()
print("Not useful because all the points stay on their species line as that is a discrete category and not continous")

# 2.2.5.5
print("It needs a mapping argument")
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()

# 2.2.5.6
print("It tells the func wether or not to ignore NA values in its execution. Default is FALSE")
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(na.rm = TRUE)

# 2.2.5.7
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point() + 
  labs(
    subtitle = "Data come from the palmerpenguins package."
  )

# 2.2.5.8
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = bill_depth_mm)) +
  geom_smooth()

# 2.2.5.9
print("Removes confidence bands (se=standard error?)")
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# 2.2.5.10
print("No because they're both passing in the same args to geoms, just in different places")
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

# ---------------- Section 2.4 ------------------- 

# 1
ggplot(penguins, aes(y = fct_infreq(species))) +
  geom_bar()
print("Rotated 90 degrees, count is on x axis")

# 2
print("fill is more useful because it changes the bar's whole color, not just its border")
ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

# 3
print("Bins changes the width of the intervals on the x axis")

# 4
min(diamonds$carat)
max(diamonds$carat)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.1)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.5)
print("I think 0.1 is the best because it's not too thin like 0.01 or too wide like 0.5 which only has 7 visible bars")
print("It demonstrates that the most popular carats are the whole numbers and the halves")

# ------------------ Section 2.5 ---------------

# 1
?mpg
print("Categorical: manufacturer, model, year, cyl, trans, drv, fl, class")
print("Cont: displ, cty, hwy")

# 2
ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point()

ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point(aes(color = cty))

ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point(aes(size = cty))

ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point(aes(color = cty, size = cty))

ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point(aes(shape = cty)) #doesn't work, needs categorical var

print("It's more of a gradient of each type for numerical and it makes the graphs really hard to read.")

# 3
ggplot(mpg, aes(x = hwy, y = displ)) +
  geom_point(aes(linewidth = cty))

print("Doesn't look like anything changes because it's a scatterplot")

# 4
print("Both of the aesthitics vary, like color and size will increase or decrease together")

# 5
ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(aes(color = species))

print("Adelie have shorter but deeper bills, Gentoo have longer but shallower bills, and Chinstrap have long and deep bills")

# 6 
print("Because in labs() it's only labeling color, but it needs to label both")
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species", shape = "Species")

# ---------------- Section 2.6 -----------------

# 1
print("The scatterplot, because it is the most recent one")

# 2
print("mpg-plot.pdf")







