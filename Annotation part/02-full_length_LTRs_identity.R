library(tidyverse)
library(data.table)

setwd("/Users/les.eaux/Desktop/UNIFR 2024:25/Annotation of eukaryotic genomes")
# Load the data
anno_data=read.table("ERR11437341.asm.bp.p_ctg.fa.mod.LTR.intact.gff3",header=F,sep="\t")
head(anno_data)
# Get the classification table
classification=fread("ERR11437341.asm.bp.p_ctg.fa.mod.LTR.intact.fa.rexdb-plant.cls.tsv")

## NOTE:
# Or get the file by running the following command in bash:
# TEsorter assembly.fasta.mod.EDTA.raw/assembly.fasta.mod.LTR.intact.fa -db rexdb-plant
# It will be named as assembly.fasta.mod.LTR.intact.fa.rexdb-plant.cls.tsv
# Then run the following command in R:
# classification=fread("assembly.fasta.mod.EDTA.raw/assembly.fasta.mod.LTR.intact.fa.rexdb-plant.cls.tsv")

head(classification)
# Separate first column into two columns at "#", name the columns "Name" and "Classification"
names(classification)[1]="TE"
classification=classification%>%separate(TE,into=c("Name","Classification"),sep="#")


# Check the superfamilies present in the GFF3 file, and their counts
anno_data$V3 %>% table()

# Filter the data to select only TE superfamilies, (long_terminal_repeat, repeat_region and target_site_duplication are features of TE)
anno_data_filtered <- anno_data[!anno_data$V3 %in% c("long_terminal_repeat","repeat_region","target_site_duplication"), ]
nrow(anno_data_filtered)
# QUESTION: How Many TEs are there in the annotation file?

# 398 TEs

# Check the Clades present in the GFF3 file, and their counts
# select the feature column V9 and get the Name and Identity of the TE
anno_data_filtered$named_lists <- lapply(anno_data_filtered$V9, function(line) {
  setNames(
    sapply(strsplit(strsplit(line, ";")[[1]], "="), `[`, 2),
    sapply(strsplit(strsplit(line, ";")[[1]], "="), `[`, 1)
  )
})

anno_data_filtered$Name <- unlist(lapply(anno_data_filtered$named_lists, function(x) {
  x["Name"]
}))

anno_data_filtered$Identity <-unlist(lapply(anno_data_filtered$named_lists, function(x) {
  x["ltr_identity"]
}) )

anno_data_filtered$length <- anno_data_filtered$V5 - anno_data_filtered$V4

anno_data_filtered =anno_data_filtered %>%select(V1,V4,V5,V3,Name,Identity,length) 
head(anno_data_filtered)

# Merge the classification table with the annotation data
anno_data_filtered_classified=merge(anno_data_filtered,classification,by="Name",all.x=T)

table(anno_data_filtered_classified$Superfamily)
# QUESTION: Most abundant superfamilies are?
# Gypsy is the most abundant

table(anno_data_filtered_classified$Clade)

max(table(anno_data_filtered_classified$Clade))
# QUESTION: Most abundant clades are?
 # Bianca and Ale

# Now plot the distribution of TE percent identity per clade 

anno_data_filtered_classified$Identity=as.numeric(as.character(anno_data_filtered_classified$Identity))

anno_data_filtered_classified$Clade=as.factor(anno_data_filtered_classified$Clade)

# Define binwidth based on the Identity data range and number of observations
binwidth_value <- (max(anno_data_filtered_classified$Identity) - min(anno_data_filtered_classified$Identity)) / sqrt(nrow(anno_data_filtered_classified))

# Create the plot with the adjusted binwidth
plot_sf = ggplot(anno_data_filtered_classified, aes(x = Identity)) +
  geom_histogram(color="black", fill="grey", binwidth = binwidth_value) +  # Adjust binwidth
  facet_grid(Superfamily ~ .) +  
  cowplot::theme_cowplot()

# Save the plot to a PDF file
pdf("01_full-length-LTR-RT-superfamily.pdf")
plot(plot_sf)
dev.off()



# Calculate an appropriate binwidth based on the Identity range and number of observations
binwidth_value <- (max(anno_data_filtered_classified$Identity) - min(anno_data_filtered_classified$Identity)) / sqrt(nrow(anno_data_filtered_classified))

# Create the plot for each clade, excluding unknown Superfamilies
plot_cl = ggplot(anno_data_filtered_classified[anno_data_filtered_classified$Superfamily != "unknown",], aes(x = Identity)) +
  geom_histogram(color = "black", fill = "grey", binwidth = binwidth_value) +  # Adjust binwidth
  facet_grid(Clade ~ Superfamily) +  
  cowplot::theme_cowplot()

# Save the plot to a PDF with specified height
pdf("01_full-length-LTR-RT-clades.pdf", height = 20)
plot(plot_cl)
dev.off()

