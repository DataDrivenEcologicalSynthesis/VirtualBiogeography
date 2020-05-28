##Pulling species occurrence records from the movie Finding Nemo from GBIF for DDES 2020

#libraries
library(rgbif)

#Pulling focal species data from GBIF
#Focal species are Amphiprion ocellaris (clownfish), Aetobatus narinari (spotted eagle ray), 
#Opisthoteuthis californiana (flapjack octopus), Forcipiger flavissimus (lognose butterflyfish), Hippocampus kuda (seahorse)
#Paracanthurus hepatus (Blue tang)

focalspecies<-c("Amphiprion ocellaris", "Aetobatus narinari", "Opisthoteuthis californiana", "Forcipiger flavissimus", "Hippocampus kuda", "Paracanthurus hepatus") #creating an object called focalspecies with a list of our focal species
focalkeys<-sapply(focalspecies, function(x) name_suggest(x)$key[1], USE.NAMES = FALSE) #function to get the taxonomic key for each species, the taxonic key is a number required by rgbif to lookup each sp in the next step
focalsp<-occ_search(taxonKey=paste0(focalkeys, collapse=";"),hasCoordinate = TRUE, hasGeospatialIssue = FALSE, limit=200000) #extracting occurrence records for focal species - only getting recrods with lat/long and without geospatial issues. 
#GBIF has a default limit of 500 occurrence records pulled so increasing the limit to the max = 200,000 (we have ~34000 records)
focaldf<-data.frame(focalsp$data) #converts the output from a tibble to a dataframe, this allows conversion to csv file

write.csv(focaldf, "Databases/GBIFOccurrences/FocalSpeciesGBIFFULL.csv") #all columns saved

focused<-focused<-subset(focaldf[, 2:4]) #subsetting the original dataframe to just contain species names and lat/longs

write.csv(focused, "Databases/GBIFOccurrences/FocalSpeciesGBIFMinimal.csv") #csv file of occurrences by species names and lat/longs only


##Example of getting the data for one species at a time
key<-name_suggest(q="Amphiprion ocellaris", rank="species")$key[1] #searches sp name ensures its correct and returns the first value which is the taxon key needed in the next line
sp1<-occ_search(taxonKey=key, hasCoordinate = TRUE, hasGeospatialIssue = FALSE)#search for occurrence records for the species from the taxon key in previous step, only returning those with coordinate data and with no spatial issues
sp1df<-data.frame(sp1$data)#converts from tibble to dataframe to write csv
write.csv(sp1df, "data/GBIFOccurrences/Amphiprion_ocellaris_GBIF.csv") #wrote csv to data folder under GBIF occurrences