#Folder to keep all GBIF occurrence data

#Amphiprion_ocellaris_GBIF.csv
File containing occurrence records pulled from GBIF using rgbif for Amphiprion ocellaris (clown fish)
This file was generated when testing out how to pull occurrence records from GBIF. 
Script for code is available in the scripts folder

#FocalSpeciesGBIFFULL.csv
File containing the six focal species occurrence records pulled from GBIF. This file contains all columns pulled from GBIF
The six focal species are
- Amphirion ocellaris (Ocellaris Clownfish)
- Aetobatus narinari (Spotted Eagle Ray)
- Opisthoteuthis californiana (Flapjack Octopus)
- Forcipiger flavissimus (Yellow Longnose Butterflyfish)
- Hippocampus kuda (Common Seahorse)
- Paracanthurus hepatus (Regal Blue Tang)
The six focal species will be used to assess the accuracy of species assemblages in the movie Finding Nemo with GBIF occurrence data.
The six focal species were selected from the species in Nemo's school
Script for genrating this file is in the scripts folder

$FocalSpeciesGBIFMinimal.csv
File generated from the FocalSpeciesGBIFFULL file but only keeping the species, latitude and longitude columns
This file was generate to remove the columns that are unnecessary for our analysis

#FocalSpeciesGBIFMinimalOpenRefine
File generated from FocalSpeciesGBIFMinimal using Open Refine. JSON script of refinements is available in the scripts folder
The species names columns had many synonyms for our focal species, similar but non-focal species, and some unidentifiable species
Species synonyms were clustered to the current accepted taxonomic name
Non-focal or unidentifiable species were removed
All species names had the taxonomic authority in the name, this was removed for brevity. 
