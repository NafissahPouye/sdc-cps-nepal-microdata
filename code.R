library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/sdc-cps-nepal-microdata")
data <- read_excel("data.xlsx", col_types = c("text", 
                                              "date", "text", "text", "text", "text", 
                                              "text", "text", "text", "numeric", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "text", "text", "text", "text", 
                                              "text", "numeric", "numeric"))

#UNICEF microdata
selectedKeyVars <- c('Date', 'District',	
                     'VDC_Municipality', 
                     'Gender',	'Caste_ethnicity',
                     'Occupation', 
                     'If__other__what_is_your_occupa'
                     )

#Convert variables into factors
cols =  c('Date', 'District',	
          'VDC_Municipality', 
          'Gender',	'Caste_ethnicity',
          'Occupation', 
          'If__other__what_is_your_occupa')
data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into dataframe
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)
objSDC <- createSdcObj(dat = fileRes, 
                       keyVars = selectedKeyVars
                       )

#Generating an internal (extensive) report
print(objSDC, 'risk')
report(objSDC, filename = "index", internal = TRUE) 


