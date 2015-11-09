# Scoping in both plot2 and plot 3
# We need plotting functionalities from both plot2 and plot3


source("plot2.R")
source("plot3.R")

# Obtaining formatted data set from plot2; scoped_out_values is from plot2.R

x_values <- scoped_out_values()


png("plot4.png", width=480, height=480)

# 2 rows by 2 columns

par(mfrow=c(2,2))

# First plot is plot2.R

plot2()

# Second plot is voltage vs date time plot; combined column is datetime

plot(x_values$combined, x_values$Voltage, ylab="Voltage", xlab="datetime", type="l", col="black")

# Third plot is plot3 but this time the legend does not have a box; to_box=FALSE

plot3(FALSE)

# Fourth plot is Global_reactive_power vs date time

plot(x_values$combined, x_values$Global_reactive_power,ylab="Global_reactive_power", xlab="datetime" ,type="l", col="black")

dev.off()


