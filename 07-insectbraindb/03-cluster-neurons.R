# Use NBLAST to cluster neurons by structure

library(nat.nblast)

load("tedoren.rda")

# subset neuronlist down to the Monarch neurons
dpn=subset(tedoren, Species=="Danaus plexippus")

# convert to dotprops representation for nblast
# resample every 5µm since these neurons are big
# note use of progress bar since this is a bit slow!
message("converting neurons to dotprops for nblast")
dpn2=dotprops(dpn, resample=5, .progress='text')

message("calculating all by all nblast scores for these neurons")
aba=nblast_allbyall(dpn2)

# plot our clustering
# note use of the Neuron name as a label 
# (fetched from the data.frame attached to dpn neuronlist)
# Looks like sensible relationships between neurons with similar names
plot(nhclust(scoremat=aba), labels=with(dpn, Neuron ))

# TODO
# Delevop a mapping of left to right for this brain region
# likely based on this
# http://onlinelibrary.wiley.com/doi/10.1002/cne.23054/abstract
# to better compare neurons on left and right side of brain.
