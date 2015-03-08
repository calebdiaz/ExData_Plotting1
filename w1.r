
# DOWNLOAD AND UNZIP SOURCE FILE
w1_download_and_unzip_file <- function() {

    s_zipfile <- "household_power_consumption.txt.zip"
  
    if (file.exists(s_zipfile) == F) {
      
      print("Downloading data file...")
      
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method = "curl", destfile = s_zipfile)
      
      print("Data downloaded")
      
    }
    
    print("Unziping data file...")
    
    unzip(s_zipfile)
}

# CREATE SUBSET FILE FOR DATES FROM 2007-02-01 TO 2007-02-02
# LINUX, MAC SHELL ONLY
w1_create_subset_file <- function(s_file_name) {

  
  if (file.exists("household_power_consumption.txt") == F) {
   
    w1_download_and_unzip_file()
  }
  
  print("Creating subset file with shell commands...")
  
  system(paste("cat household_power_consumption.txt | grep ^Date > ", s_file_name, "; cat household_power_consumption.txt | grep ^1/2/2007 >> ", s_file_name, "; cat household_power_consumption.txt | grep ^2/2/2007 >> ", s_file_name))
}

# READS THE SUBSET FILE
w1_read_subset_file <- function(s_file_name) {
  
  hh_pc <- read.csv(s_file_name, sep=";", na.strings="?")
  
  hh_pc$DateTime <- strptime( paste(hh_pc$Date, hh_pc$Time, sep=""), format="%d/%m/%Y %H:%M:%S", tz="UTC")
                              
  hh_pc$Date <- as.Date(hh_pc$Date, format="%d/%m/%Y")
  
  hh_pc
}


s_file_name <- "hh_pc.csv"

w1_init <- function() {
  
  Sys.setlocale("LC_TIME","en_GB.UTF8")
  
  if (file.exists(s_file_name) == F) {
    
    w1_create_subset_file(s_file_name)
    print("Subset file created")
    
  } else {
    
    print(paste("OK. The Subset file (", s_file_name, ") exists already..."))
  }
  
}



