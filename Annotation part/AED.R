# Load necessary libraries
library(ggplot2)

setwd("/Users/les.eaux/Desktop/UNIFR 2024:25/Annotation of eukaryotic genomes")
# Load the data
data <- read.table("ERR11437341.asm.bp.p_ctg.all.maker.renamed.gff.AED.txt", header = TRUE)


# Create the cumulative distribution plot
ggplot(data, aes(x = AED, y = ERR11437341.asm.bp.p_ctg.all.maker.noseq.gff.renamed.gff)) +
  geom_line(color = "skyblue") +
  geom_vline(xintercept = 0.5, color = "darkred", linetype = "dashed") +
  labs(
    title = "Cumulative Distribution Plot",
    x = "AED Score",
    y = "Cumulative Frequency"
  ) +
  theme_minimal()
