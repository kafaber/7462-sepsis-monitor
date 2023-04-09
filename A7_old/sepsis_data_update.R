#Set up libraries and links
library(tidyverse)
library(data.table)
library(lubridate)
library(googledrive)

source("sepsis_monitor_functions.R")

file_link <- "https://drive.google.com/file/d/100_D9wbWTOisrg8exmEkJUnigjJvOz4a"
folder_link <- "https://drive.google.com/drive/folders/1kLWejSQfOG-eD2XpfpofpiDaYeKq4I2l"

#drive_deauth()

#Read in sepsis data file from google drive
sepsis <- drive_read_string(file_link) %>%      #fails in Github if I don't run drive_deauth()
  fread()

#Update sepsis data file
sepsis <- sepsis %>%
  updatePatients()

#Write updated file back to google drive
sepsis %>% write_csv("sepsis_report_temp.csv")   #fails if I do run drive_deauth()
drive_put(media = "sepsis_report_temp.csv",  
          path = folder_link,
          name = "sepsis_report.csv")
