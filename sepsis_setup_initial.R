#Most code in this script is copy/pasted directly from the Assignment 7 .html

# Set up
library(tidyverse)
library(data.table) ## For the fread function
library(lubridate)

source("sepsis_monitor_functions.R")

df <- initializePatients()

#Upload csv to Google Drive
library(googledrive)

# We have to write the file to disk first, then upload it
df %>% write_csv("sepsis_report_temp.csv")

# Uploading happens here
drive_put(media = "sepsis_report_temp.csv",  
          path = "https://drive.google.com/drive/folders/1kLWejSQfOG-eD2XpfpofpiDaYeKq4I2l",
          name = "sepsis_report.csv")