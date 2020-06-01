# Species Reference Lists

## Sources

This list was built using the reference lists found [here](https://disney-animals.fandom.com/wiki/List_of_Species_seen_in_Finding_Nemo) and [here](https://parody.fandom.com/wiki/List_of_Species_from_Finding_Nemo).

## Photographs

All photographs sourced from Wikimedia Commons with the exception of:

- BF_Epinephelus-quinquefasciatus sourced from [Smithsonian Tropical Research Institute](https://biogeodb.stri.si.edu/caribbean/en/thefishes/species/4760/on)

### File names

Photographs are named as follows: taxonID_Genus-species

- Taxon abbreviations
    + IV= Invertebrate
    + CF= Cartilaginous Fish
    + BF= Bony Fish
    + RE= Reptile
    + BI= Bird
    + MA= Mammal

## Accuracy

These species lists have not yet been cross-referenced with the movie *Finding Nemo* or occurrence records from [GBIF](gbif.org). This list will serve as a reference for our identifications while watching the movie and will be updated accordingly should the two conflict.

## Data description
For species list (in `finding-nemo_full-species-list.csv`), here is how the data is being recorded:

- Location count (presence/absence of the species in each location).
    
    Location code indicated in column header:
  + DO = Phillip Sherman's Dentist office
  + EAC = East Australian Current
  + FG = Fishing Ground
  + GBR = Great Barrier Reef
  + T = Deep Sea Trench
  + SH = Sydney Haarbour
  + SL = Shark's Lair
  + SPO = South Pacific Ocean

- Count for presence/absence of a species in a location
    + 1 = present
    + 0 = absent

- Screenshot:
    
    List of the first screenshot(s) the species presence is recorded in each location.

    Additionally, unidentified species in the same screenshot will be recorded as `[number_of_unID_species-unid-optional_grouping]` following the name of the screenshot they were in (i.e. `SS_00-52-50_EAC.PNG[1-unid-moonfish]`)

    Multiple screenshots for one species will be recorded in the same cell, separated by '/' to avoid error from .csv (comma-separated values) file type.
   
> **Note**: `finding-nemo_focus-group-species.csv` is a subset of `finding-nemo_full-species-list.csv` that contains only six focal species to test the data analysis process.