#libraries
library(rgbif)

EACspecies<-c("Chelonia mydas") #creating an object called focalspecies with a list of our focal species
EACkeys<-sapply(EACspecies, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
EACsp<-occ_search(taxonKey=paste0(EACkeys, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
#GBIF has a default limit of 500 occurrence records pulled so increasing the limit to the max = 200,000 (we have ~34000 records)
EACdf<-data.frame(EACsp$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file

write.csv(EACdf, "Databases/GBIFOccurrences/EACSpeciesGBIFFULL.csv") #all columns saved

focused<-focused<-subset(EACdf[, 2:4]) #subsetting the original dataframe to just contain species names and lat/longs

write.csv(focused, "Databases/GBIFOccurrences/EACSpeciesGBIFMinimal.csv") #csv file of occurrences by species names and lat/longs only


