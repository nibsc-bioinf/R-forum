# [0] preamble
# set the working directory to where the file is located
setwd("C:/Users/emee/OneDrive - MHRA/R/User-forum")

# [10] define the input file name
# define the file name
input_file <- "Dataset.csv"

# [20] define the output file name
output_file <- paste(sub(".csv", "", input_file), "_output_R.csv", sep="")

# [30] import the unfiltered csv file
# input file does not need to be in a specific arrangement. Columns can be in any order.
unfiltered <- read.csv(file=input_file, header=TRUE, sep = ',',quote = '"')

# [40] filter data based on coverage > 100 and pR < 0.99
# can this variable be read in?, e.g. cutoff = readline(prompt="Enter anything: ")
f1 <- subset(unfiltered, unfiltered$Coverage >= 100 & unfiltered$pR <=0.99)

# [50] sort the file by sample, then chromosome, then position
f2 <- f1[order(f1$Sample, f1$Chromosome, f1$Position),]

# [60] write the filtered file to an output.
write.csv(f2, file = output_file, row.names = FALSE)
