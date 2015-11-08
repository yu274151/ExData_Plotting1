# This file is called truncated.R because it only returns subset of data points from February 1st, 2007 00:00:00 and February 2nd, 2007 23:59:00
# This file is called once for the entire course of plotting

# Drawing upon lessons learned in Getting and Cleaning Data, will use lubridate package for better date time functionalities
# For reference on lubridate, follow this URL: https://cran.r-project.org/web/packages/lubridate/lubridate.pdf



# importing lubridate into scope

library(lubridate)

# Packaging truncated file reading in a function called truc_data

trunc_data <- function() {

# Data reading; considering that there are 2,075,259 rows and that R can be a memory hog, will only read necessary observations only
# Known fact: first observation occurred on December 16th, 2006 17:24:00
# Our starting data point of interest is February 1st, 2007 00:00:00
# From top of the file we will skip observations from December 16th, 2006 17:24:00 until January 31, 2007 23:59:00

# Step 1: using ymd_hms function from lubridate to convert December 16th, 2006 17:24:00 and January 31, 2007 23:59:00 as datetime objects
# Step 2: using as.duration to calculate the duration between two datetimes (interval functions aids in measuring an interval between those dates)

minutes_to_skip <- interval(ymd_hms("2006-12-16 17:24:00"), ymd_hms("2007-01-31 23:59:00"))
minutes_to_skip <- as.duration(minutes_to_skip)

# Note: as.duration reutrns character 
# From prompt > minutes_to_skip
# [1] "3998100s (~46.27 days)"

# We covert to yield the numeric value in second and than convert to minute by dividing by 60
# Data points are minute of interest; we add +1 because we read header into memory too from the top

minutes_to_skip <- as.numeric(minutes_to_skip) / 60 + 1

# Instead of reading till end of the file, we need to read minute observations over the span of 2 days
# There are 48 hours in 2 days; we simply multiply 48 with 60 to reach to minutes

to_read <- 48*60

renamed_col_names <- c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# It's better to amend column classes through read.table for performance reason and once and for all
# First two column classes will be read as character; remaining 7 columns will be read as numeric

renamed_col_classes <- c("character", "character", rep("numeric", times = 7))

# Reading dataset into memory and referring it via variable trunc_data

trunc_set <- read.table("household_power_consumption.txt", na.strings=c("?"), sep=";", skip=minutes_to_skip, nrows=to_read, header=TRUE, stringsAsFactors=FALSE, colClasses = renamed_col_classes, col.names = renamed_col_names)
trunc_set

}

# Scoping this R file will make trunc_data function for other programs

