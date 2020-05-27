##Pulling species occurrence records from the movie Finding Nemo from GBIF for DDES 2020

#libraries
library(rgbif)

key<-name_suggest(q="Amphiprion ocellaris", rank="species")$key[1] #searches sp name ensures its correct and returns the first value which is the taxon key needed in the next line
sp1<-occ_search(taxonKey=key, hasCoordinate = TRUE, hasGeospatialIssue = FALSE)#search for occurrence records for the species from the taxon key in previous step, only returning those with coordinate data and with no spatial issues
sp1df<-data.frame(sp1$data)#converts from tibble to dataframe to write csv
write.csv(sp1df, "data/GBIFOccurrences/Amphiprion_ocellaris_GBIF.csv") #wrote csv to data folder under GBIF occurrences