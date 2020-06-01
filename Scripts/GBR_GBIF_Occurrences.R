#Great Barrier Reef species occurrence records from GBIF

#libraries
library(readxl) #reads excel files
library(rgbif) #accesses gbif
library(plyr) #used to join dataframes with different columns

#read excel file as species list
GBRsp<-read_excel("Databases/Species_By_Locations/GBR_Species.xlsx") #function to read excel files
GBRsp<-as.data.frame(GBRsp) #converts from tibble to dataframe
GBR<-GBRsp[[1]] #turning the dataframe into a vector, or list of species names, to read into the next code
GBR[GBR=="Hexabranchus sanguineas"]<-"Hexabranchus sanguineus" #fixing typos
GBR[GBR=="Pygoplites diancathus"]<-"Pygoplites diacanthus" #fixing typos
GBR<-GBR[!GBR %in% c("Amphiprion ocellaris", "Aetobatus narinari", "Opisthoteuthis californiana", "Forcipiger flavissimus", "Hippocampus kuda", "Paracanthurus hepatus")] #removing focal species that we already pulled

GBRkeys<-sapply(GBR, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
GBRkeys1<-(GBRkeys[1:10]) #there are too many occurrence records to download so dividing the job
GBRkeys2<-(GBRkeys[11:19])

GBRspp1<-occ_search(taxonKey=paste0(GBRkeys1, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=100000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
#GBIF has a default limit of 500 occurrence records pulled so increasing the limit to the max = 100,000
GBRspp2<-occ_search(taxonKey=paste0(GBRkeys2, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=100000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 

GBR1<-data.frame(GBRspp1$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file
GBR2<-data.frame(GBRspp2$data)
GBR3<-rbind.fill(GBR1, GBR2) #need rbind.fill because there are differen column names so rbind wont work
GBR3<-subset(GBR3[,c(1:4)]) #dataset is too large to upload to removed alot of the unnecessary columns

write.csv(GBR3, "Databases/GBIFOccurrences/GBR_GBIFMin.csv") #file was too large to upload all columns so just uploading the min amount we need