##Pulling species occurrence records from the movie Finding Nemo from GBIF for DDES 2020

#libraries
library(rgbif)

#Pulling focal species data from GBIF
#Focal species are Amphiprion ocellaris (clownfish), Aetobatus narinari (spotted eagle ray), 
#Opisthoteuthis californiana (flapjack octopus), Forcipiger flavissimus (lognose butterflyfish), Hippocampus kuda (seahorse)
#Paracanthurus hepatus (Blue tang)

SLspecies<-c("Synchiropus picturatus", "Carcharodon carcharias", "Isurus oxyrinchus", "Sphyrna mokarran") #creating an object called focalspecies with a list of our focal species
SLkeys<-sapply(SLspecies, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
SLsp<-occ_search(taxonKey=paste0(SLkeys, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
#GBIF has a default limit of 500 occurrence records pulled so increasing the limit to the max = 200,000 (we have ~34000 records)
SLdf<-data.frame(SLsp$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file

write.csv(SLdf, "Databases/GBIFOccurrences/SLSpeciesGBIFFULL.csv") #all columns saved

focused<-focused<-subset(SLdf[, 2:4]) #subsetting the original dataframe to just contain species names and lat/longs

write.csv(focused, "Databases/GBIFOccurrences/SLSpeciesGBIFMinimal.csv") #csv file of occurrences by species names and lat/longs only


