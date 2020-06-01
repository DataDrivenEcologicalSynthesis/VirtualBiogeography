#Great Barrier Reef species occurrence records from GBIF

#libraries
library(readxl) #reads excel files
library(rgbif) #accesses gbif

#read excel file as species list
GBRsp<-read_excel("Databases/Species_By_Locations/GBR_Species.xlsx") #function to read excel files
GBRsp<-as.data.frame(GBRsp) #converts from tibble to dataframe
GBR<-GBRsp[[1]] #turning the dataframe into a vector, or list of species names, to read into the next code
GBR[GBR=="Hexabranchus sanguineas"]<-"Hexabranchus sanguineus" #fixing typos
GBR[GBR=="Pygoplites diancathus"]<-"Pygoplites diacanthus" #fixing typos
GBR<-GBR[!GBR %in% c("Amphiprion ocellaris", "Aetobatus narinari", "Opisthoteuthis californiana", "Forcipiger flavissimus", "Hippocampus kuda", "Paracanthurus hepatus")] #removing focal species that we already pulled

GBRkeys<-sapply(GBR, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
GBRspp<-occ_search(taxonKey=paste0(GBRkeys, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
#GBIF has a default limit of 500 occurrence records pulled so increasing the limit to the max = 200,000 (we have ~34000 records)
focaldf<-data.frame(focalsp$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file

write.csv(focaldf, "Databases/GBIFOccurrences/FocalSpeciesGBIFFULL.csv") #all columns saved

focused<-focused<-subset(focaldf[, 2:4])