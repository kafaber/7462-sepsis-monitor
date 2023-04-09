#Set up
library(tidyverse)
library(data.table)
library(lubridate)
library(googledrive)
library(tictoc)

source("sepsis_monitor_functions.R")

drive_folder_link <- "https://drive.google.com/drive/folders/1kLWejSQfOG-eD2XpfpofpiDaYeKq4I2l"
drive_file_link <- "https://drive.google.com/file/d/100_D9wbWTOisrg8exmEkJUnigjJvOz4a"

#Task 2: Speed Reading------------------------------------------------------
tic()
data <- makeSepsisDataset(n = 50, read_fn = "fread")
toc()
#7.4 seconds to read in 50 patients with fread

tic()
data <- makeSepsisDataset(n = 100, read_fn = "fread")
toc()
#12.69 seconds to read in 100 patients with fread

tic()
data <- makeSepsisDataset(n = 500, read_fn = "fread")
toc()
#59.75 seconds to read in 500 patients with fread

tic()
data <- makeSepsisDataset(n = 50, read_fn = "read_delim")
toc()
#32.52 seconds to read in 50 patients with read_delim

tic()
data <- makeSepsisDataset(n = 100, read_fn = "read_delim")
toc()
#72.44 seconds to read in 100 patients with read_delim

tic()
data <- makeSepsisDataset(n = 500, read_fn = "read_delim")
toc()
#428.2 seconds to read in 500 patients with read_delim

#Task 3: Google Drive Upload------------------------------------------------
df <- makeSepsisDataset()
df %>% write_csv("sepsis_data_temp.csv")
sepsis_file <- drive_put(media = "sepsis_data_temp.csv", 
                         path = drive_folder_link,
                         name = "sepsis_data.csv")
sepsis_file %>% drive_share_anyone()
