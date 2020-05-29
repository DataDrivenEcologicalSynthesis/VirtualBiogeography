#making plots of records removed at data cleaning stage
library(ggplot2)
#36307 records total

focalmin<-read.csv("C:/Users/Amanda/Documents/PhD/Courses/DDES/VirtualBiogeography/Databases/GBIFOccurrences/FocalSpeciesGBIFMinimal.csv")
focalrefine<-read.csv("C:/Users/Amanda/Documents/PhD/Courses/DDES/VirtualBiogeography/Databases/GBIFOccurrences/FocalSpeciesGBIFMinimalOpenRefine.csv")

#focalmin has 34323 occurrences with 22 species levels
#focalrefine has 34246 with 6 species levels

df<-data.frame(dataclean=c("Geoissues", "Refined"), occurrences=c(1984, 77))

dcbars<-ggplot(data=df, aes(x=dataclean, y=occurrences)) +
  geom_bar(stat="identity", width=0.5, fill="gold2") +
  geom_text(aes(label=occurrences), vjust=-0.3, size=5)+
  ylab("Occurrences Removed")+
  theme_classic() +theme(text=element_text(size=16), axis.title.x=element_blank())
dcbars

names(focalrefine)

sppcount <- focalrefine %>% group_by(scientificName) %>% summarise(n=length(scientificName))

ocbars<-ggplot(data=sppcount, aes(x=scientificName, y=n, fill=scientificName)) +
  geom_bar(stat="identity", width=0.5) +
  geom_text(aes(label=n), vjust=-0.3, size=5)+ xlab("") +
  ylab("Occurrences")+ scale_fill_manual(values=c("cyan2", "orange", "yellow", "gold2", "magenta", "blue"))+
  theme_classic() +theme(text=element_text(size=16), axis.text.x =element_blank())
  ocbars