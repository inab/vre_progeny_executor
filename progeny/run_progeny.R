if (!require("librarian"))
  install.packages("librarian")
librarian::shelf(dplyr, tibble, ggplot2, progeny, cran_repo = "https://cloud.r-project.org/")

message("STARTING PROGENy PROCESS")

message("Reading input arguments:")

args <- commandArgs(trailingOnly = TRUE)
progeny_file <- args[1]
organism <- args[2]
zscores <- as.logical(args[3])
top <- as.numeric(args[4])

message(paste("\t- expression matrix:", progeny_file, sep = " "))
message(paste("\t- organism:", organism, sep = " "))
message(paste("\t- z-scores:", zscores, sep = " "))
message(paste("\t- top:", top, sep = " "))

progeny_data <- as.matrix(read.csv(progeny_file, row.names = 1))

file_csv <- paste0("progeny_scores_", organism, "_", top, ".csv")

message("RUNNING PROGENy")

PathwayActivity_counts <- progeny::progeny(
  progeny_data,
  scale = TRUE,
  organism = organism,
  top = top,
  perm = 10000,
  z_scores = zscores
)

PathwayActivity_counts <- as.data.frame(t(PathwayActivity_counts))

write.csv(PathwayActivity_counts, file_csv, quote = F)

message(paste(
  "PROGENy ended successfully; see results",
  normalizePath(file_csv),
  sep = " "
))

message("FINISHING PROGENy PROCESS")