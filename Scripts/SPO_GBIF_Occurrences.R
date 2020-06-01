#SPO pulling occurrence records from GBIF
library(readxl) #reads excel files
library(rgbif) #accesses gbif
#library(plyr) #used to join dataframes with different columns

#read excel file as species list
SPOsp<-read_excel("Databases/Species_By_Locations/SPO_Species.xlsx") #function to read excel files
SPOsp<-as.data.frame(SPOsp) #converts from tibble to dataframe
SPO<-SPOsp[[1]] #turning the dataframe into a vector, or list of species names, to read into the next code
SPOkeys<-sapply(SPO, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
SPOspp<-occ_search(taxonKey=paste0(SPOkeys, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=100000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 

SPOdf<-data.frame(GBRspp$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file

write.csv(SPOdf, "Databases/GBIFOccurrences/SPO_GBIFFULL.csv")

SPOdfmin<-subset(SPOdf[,1:4])

write.csv(SPOdf, "Databases/GBIFOccurrences/SPO_GBIFMinL.csv")