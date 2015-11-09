# Drawing upon lessons learned in Getting and Cleaning Data, will use dplyr package extensively here
# For reference on dplyr, follow this URL: https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html

# importing dplyr into scope

library(dplyr)

# We source truncated.R

source("truncated.R")

# Calling trunc_data() returns data set on per minute observation from 2007-02-01 00:00:00 to 2007-02-02 23:59:00 (pattern: YYYY-MM-DD [space] HH:MM:SS)

values_read <- trunc_data()

# Because plot2, plot3 and plot4 basically uses a formatted data set, we will read the data set once into memory from this point onward


# Modifying values_read through dplyr functions 


# First: used paste function to combine character values from Date and Time column into one

# Second: used dmy_hms function from lubridate to aforementioned column values to datetime

# Note: the representation in data set is DD/MM/YYYY (space) HH:MM:SS; hence, used dmy_hms to parse that character value

# Third: used transmute function from dplyr and saved it in a new field called "combined"; it is referred by date_time (named aptly)

# Fourth, other_obsvs refers to columns returned by using select function of dplyr

# select() only opts for rest of numeric columns (7) 

# Finally, used bind_cols to combine one date_time columns with those of the remaining 7 to form 

# Note: transmute changes the dataset as desired here and returns one with new variable

# Note: calling derived_dataFrame returns a data set containing 8 rows instead of original 9


derived_dataFrame <- function(){

date_time <- transmute(values_read, combined = dmy_hms(paste(Date, Time)))

other_obsvs <- select(values_read, Global_active_power:Sub_metering_3)

derived <- bind_cols(date_time, other_obsvs)

derived

}


# We call and retain data set returned from above into interim_values

interim_values <- derived_dataFrame()

# plot4's first plot is plot2; it would be prudent to make it a function

plot2 <- function() {

x_values <- interim_values$combined

y_values <- interim_values$Global_active_power

plot(x_values, y_values, type="l", ylab="Global Active Power (kilowatts)", xlab="")

}

png("plot2.png", width=480, height=480)
plot2()
dev.off()

# Finally we retained interim_values in a function called scope_out_values
# This function is scoped via source call in plot3 and plot4
# It makes more sense to scope out a modified data set rather than calling it again

scoped_out_values <- function(){

interim_values

}




