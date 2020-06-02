#SPO pulling occurrence records from GBIF
library(readxl) #reads excel files
library(rgbif) #accesses gbif
library(plyr) #used to join dataframes with different columns

#read excel file as species list
SPOsp<-read_excel("Databases/Species_By_Locations/SPO_Species.xlsx", col_names=FALSE) #function to read excel files
SPOsp<-as.data.frame(SPOsp) #converts from tibble to dataframe
SPO<-SPOsp[[1]] #turning the dataframe into a vector, or list of species names, to read into the next code
SPOkeys<-sapply(SPO, function(x) name_suggest(x)$key[1], USE.NAMES = TRUE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
SPOkeys1<-(SPOkeys[c(1,3:5,8)])
SPOkeys2<-(SPOkeys[2])
SPOkeys3<-(SPOkeys[6]) #will restrict to area around Australia because there are too many records
SPOkeys4<-(SPOkeys[7]) #will restrict to area around Australia because there are too many records
SPOkeys5<-(SPOkeys[9])
SPOspp1<-occ_search(taxonKey=paste0(SPOkeys1, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
SPOspp2<-occ_search(taxonKey=paste0(SPOkeys2, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
SPOspp3<-occ_search(taxonKey=paste0(SPOkeys3, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000,geometry ="POLYGON((97 -50, -153 -50, -153 16, 97 16, 97 -50))") #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
SPOspp4<-occ_search(taxonKey=paste0(SPOkeys4, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000, geometry ="POLYGON((97 -50, -153 -50, -153 16, 97 16, 97 -50))") #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
SPOspp5<-occ_search(taxonKey=2440447,hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 

SPO1<-data.frame(SPOspp1$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file
SPO2<-data.frame(SPOspp2$data)
SPO3<-data.frame(SPOspp3$data)
SPO4<-data.frame(SPOspp4$data)
SPO5<-data.frame(SPOspp5$data)
SPO5<-rbind.fill(SPO1, SPO2, SPO3, SPO4, SPO5)

SPOdfmin<-subset(SPO5[,1:4])

write.csv(SPOdfmin, "Databases/GBIFOccurrences/SPO_GBIFMin.csv")