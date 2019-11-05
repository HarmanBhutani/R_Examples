# State Sequence Mining
install.packages("Matrix")

library(Matrix)
library(arules)
library(arulesSequences)
library(TraMineR)

x <- read_baskets(con = system.file("misc", "zaki.txt", package = "arulesSequences"), 
                  info = c("sequenceID","eventID","SIZE"))

as(x, "data.frame")


s1 <- cspade(x, parameter = list(support = 0.4), control = list(verbose = TRUE))

summary(s1)

as(s1, "data.frame")

#https://cran.r-project.org/web/packages/TraMineR/vignettes/TraMineR-state-sequence.pdf
...
s1.seq <- seqdef(s1, 17:86, alphabet = s1.alphab, states = s1.scode,
                 labels = s1.lab, weights = s1$weight, xtstep = 6)

seqiplot(s1.seq, border = NA, with.legend = "right")
# Reference
#https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Sequence_Mining/SPADE


