# Sourcing truncated.R into scope

source("truncated.R")

# Reading data points into memory; refer to trunc_data function in truncated.R

values <- trunc_data()

# We're interested in Global_active_power in this plot 

plottable_value <- values$Global_active_power

# Passing a png device and name along with dimensions to plot

png("plot1.png", width=480, height=480)

# Histogram to plot

hist(plottable_value, col="red", main="Global_active_power", xlab="Global Active Power (kilowatts)")

# Saving the plot to file by calling dev.off

dev.off()


