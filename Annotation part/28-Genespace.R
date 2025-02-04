library(GENESPACE)
args <- commandArgs(trailingOnly = TRUE)
# get the folder where the genespace files are
wd <- args[1]
gpar <- init_genespace(wd = wd, path2mcscanx = "/data/courses/assembly-annotation-course/CDS_annotation/softwares/MCScanX/", nCores = 20)
out <- run_genespace(gpar, overwrite = TRUE)
