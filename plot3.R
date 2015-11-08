# Scoping in plot2.R

source("plot2.R")

# Obtaining modified data set 

values <- scoped_out_values()

# Because plot3 is part of plot4 it makes sense to make it a function
# Note: while plot3's legend is boxed, it is not the case in plot4
# Introduced to_box to control boxing or not boxing; default TRUE as is the case here

plot3 <- function(to_box=TRUE){

legend_boxing <- as.character()

plot(values$combined, values$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")

# Superimposing Sub_metering_2 whose representational colour is red

lines(values$combined, values$Sub_metering_2, type="l", col="red")

# Superimposing Sub_metering_2 whose representational colour is blue

lines(values$combined, values$Sub_metering_3, type="l", col="blue")

# Annotating legend on the final output; chosen corner is top right

if (to_box){

legend_boxing <- "o"

} else{

legend_boxing <- "n"
}


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5, bty=legend_boxing)

}

png("plot3.png", width=480, height=480)

plot3()

dev.off()




