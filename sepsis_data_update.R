#Set up libraries and links
library(tidyverse)
library(data.table)
library(lubridate)
library(googledrive)

file_link <- "https://drive.google.com/file/d/1dYPoQSlCCo2LZqeBi8ia2oIhmCRI3rOF"
folder_link <- "https://drive.google.com/drive/folders/1kLWejSQfOG-eD2XpfpofpiDaYeKq4I2l"

#Read in sepsis data file from google drive
sepsis <- drive_read_string(file_link) %>%
  fread()

#Update sepsis data file
sepsis <- sepsis %>%
  updatePatients()

#Write updated file back to google drive
df %>% write_csv("sepsis_report_temp.csv")
drive_put(media = "sepsis_report_temp.csv",  
          path = folder_link,
          name = "sepsis_report.csv")