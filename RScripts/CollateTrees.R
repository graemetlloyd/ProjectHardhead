# SCRIPT TO COLLATE TREES POST TNT INFERENCE AND PRE STRAT CONGRUENCE

# Load metatree library:
library(metatree)

# Read in TNT tree output:
HypothesisOneSTRMPTs <- readLines("~/HypothesisOneSTRMPTs.nex", warn = FALSE)
HypothesisTwoSTRMPTs <- readLines("~/HypothesisTwoSTRMPTs.nex", warn = FALSE)
HypothesisThreeSTRMPTs <- readLines("~/HypothesisThreeSTRMPTs.nex", warn = FALSE)
HypothesisFourSTRMPTs <- readLines("~/HypothesisFourSTRMPTs.nex", warn = FALSE)
HypothesisFiveSTRMPTs <- readLines("~/HypothesisFiveSTRMPTs.nex", warn = FALSE)
HypothesisSixSTRMPTs <- readLines("~/HypothesisSixSTRMPTs.nex", warn = FALSE)

# Isolate and reformat trees as ape trees:
HypothesisOneSTRMPTs <- ape::read.tree(text = gsub(" ", "", HypothesisOneSTRMPTs[which(unlist(lapply(strsplit(HypothesisOneSTRMPTs, ""), function(x) x[1] == "(")))]))
HypothesisTwoSTRMPTs <- ape::read.tree(text = gsub(" ", "", HypothesisTwoSTRMPTs[which(unlist(lapply(strsplit(HypothesisTwoSTRMPTs, ""), function(x) x[1] == "(")))]))
HypothesisThreeSTRMPTs <- ape::read.tree(text = gsub(" ", "", HypothesisThreeSTRMPTs[which(unlist(lapply(strsplit(HypothesisThreeSTRMPTs, ""), function(x) x[1] == "(")))]))
HypothesisFourSTRMPTs <- ape::read.tree(text = gsub(" ", "", HypothesisFourSTRMPTs[which(unlist(lapply(strsplit(HypothesisFourSTRMPTs, ""), function(x) x[1] == "(")))]))
HypothesisFiveSTRMPTs <- ape::read.tree(text = gsub(" ", "", HypothesisFiveSTRMPTs[which(unlist(lapply(strsplit(HypothesisFiveSTRMPTs, ""), function(x) x[1] == "(")))]))
HypothesisSixSTRMPTs <- ape::read.tree(text = gsub(" ", "", HypothesisSixSTRMPTs[which(unlist(lapply(strsplit(HypothesisSixSTRMPTs, ""), function(x) x[1] == "(")))]))

# Write STR trees to file:
write.tree(HypothesisOneSTRMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/STRTrees.tre")
write.tree(HypothesisTwoSTRMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/STRTrees.tre")
write.tree(HypothesisThreeSTRMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/STRTrees.tre")
write.tree(HypothesisFourSTRMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/STRTrees.tre")
write.tree(HypothesisFiveSTRMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/STRTrees.tre")
write.tree(HypothesisSixSTRMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/STRTrees.tre")

# Read in STR tables:
HypothesisOneSTRTable <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/MetatreeFiles/STR.txt", header = TRUE, stringsAsFactors = FALSE)
HypothesisTwoSTRTable <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/MetatreeFiles/STR.txt", header = TRUE, stringsAsFactors = FALSE)
HypothesisThreeSTRTable <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/MetatreeFiles/STR.txt", header = TRUE, stringsAsFactors = FALSE)
HypothesisFourSTRTable <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/MetatreeFiles/STR.txt", header = TRUE, stringsAsFactors = FALSE)
HypothesisFiveSTRTable <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/MetatreeFiles/STR.txt", header = TRUE, stringsAsFactors = FALSE)
HypothesisSixSTRTable <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/MetatreeFiles/STR.txt", header = TRUE, stringsAsFactors = FALSE)

# Safely reinsert the missing taxa to generate full trees:
Claddis::SafeTaxonomicReinsertion(treefile.in = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/STRTrees.tre", treefile.out = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/FullTrees.tre", str.list = HypothesisOneSTRTable, multi.placements = "random")
Claddis::SafeTaxonomicReinsertion(treefile.in = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/STRTrees.tre", treefile.out = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/FullTrees.tre", str.list = HypothesisTwoSTRTable, multi.placements = "random")
Claddis::SafeTaxonomicReinsertion(treefile.in = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/STRTrees.tre", treefile.out = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/FullTrees.tre", str.list = HypothesisThreeSTRTable, multi.placements = "random")
Claddis::SafeTaxonomicReinsertion(treefile.in = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/STRTrees.tre", treefile.out = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/FullTrees.tre", str.list = HypothesisFourSTRTable, multi.placements = "random")
Claddis::SafeTaxonomicReinsertion(treefile.in = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/STRTrees.tre", treefile.out = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/FullTrees.tre", str.list = HypothesisFiveSTRTable, multi.placements = "random")
Claddis::SafeTaxonomicReinsertion(treefile.in = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/STRTrees.tre", treefile.out = "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/FullTrees.tre", str.list = HypothesisSixSTRTable, multi.placements = "random")

# Read full trees in:
HypothesisOneFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/FullTrees.tre")
HypothesisTwoFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/FullTrees.tre")
HypothesisThreeFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/FullTrees.tre")
HypothesisFourFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/FullTrees.tre")
HypothesisFiveFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/FullTrees.tre")
HypothesisSixFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/FullTrees.tre")

# Ladderize each tree and drop allzero outgroup:
HypothesisOneFullMPTs <- lapply(HypothesisOneFullMPTs, function(x) ape::drop.tip(ape::ladderize(x, right = FALSE), "allzero"))
HypothesisTwoFullMPTs <- lapply(HypothesisTwoFullMPTs, function(x) ape::drop.tip(ape::ladderize(x, right = FALSE), "allzero"))
HypothesisThreeFullMPTs <- lapply(HypothesisThreeFullMPTs, function(x) ape::drop.tip(ape::ladderize(x, right = FALSE), "allzero"))
HypothesisFourFullMPTs <- lapply(HypothesisFourFullMPTs, function(x) ape::drop.tip(ape::ladderize(x, right = FALSE), "allzero"))
HypothesisFiveFullMPTs <- lapply(HypothesisFiveFullMPTs, function(x) ape::drop.tip(ape::ladderize(x, right = FALSE), "allzero"))
HypothesisSixFullMPTs <- lapply(HypothesisSixFullMPTs, function(x) ape::drop.tip(ape::ladderize(x, right = FALSE), "allzero"))

# Reset class to multiPhylo:
class(HypothesisOneFullMPTs) <- class(HypothesisTwoFullMPTs) <- class(HypothesisThreeFullMPTs) <- class(HypothesisFourFullMPTs) <- class(HypothesisFiveFullMPTs) <- class(HypothesisSixFullMPTs) <- "multiPhylo"

# Write out reformatted trees:
write.tree(HypothesisOneFullMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/FullTrees.tre")
write.tree(HypothesisTwoFullMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/FullTrees.tre")
write.tree(HypothesisThreeFullMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/FullTrees.tre")
write.tree(HypothesisFourFullMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/FullTrees.tre")
write.tree(HypothesisFiveFullMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/FullTrees.tre")
write.tree(HypothesisSixFullMPTs, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/FullTrees.tre")

# Make consensus trees:
HypothesisOneFullSC <- consensus(HypothesisOneFullMPTs)
HypothesisTwoFullSC <- consensus(HypothesisTwoFullMPTs)
HypothesisThreeFullSC <- consensus(HypothesisThreeFullMPTs)
HypothesisFourFullSC <- consensus(HypothesisFourFullMPTs)
HypothesisFiveFullSC <- consensus(HypothesisFiveFullMPTs)
HypothesisSixFullSC <- consensus(HypothesisSixFullMPTs)

# Build PDF of consensus trees for visualisation:
pdf("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/PDFTrees/ConstraintConsensusTrees.pdf", width = 10, height = 25)
plot(HypothesisOneFullSC, cex = 0.3, main = "1. Monophyletic Lissamphibia inside Temnospondyli")
plot(HypothesisTwoFullSC, cex = 0.3, main = "2. Monophyletic Lissamphibia inside Lepospondyli")
plot(HypothesisThreeFullSC, cex = 0.3, main = "3. Diphyletic Lissamphibia (Batrachia inside Temnospondyli and Gymnophiona inside Lepospondyli)")
plot(HypothesisFourFullSC, cex = 0.3, main = "4. Diphyletic Lissamphibia inside Temnospondyli (Batrachia and Gymnophiona as separate clades)")
plot(HypothesisFiveFullSC, cex = 0.3, main = "5. Triphyletic Lissamphibia (Anuri and Caudata inside Temnospondyli,\nGymniophona inside Lepospondyli and Crown Lissamphibia monophyletic)")
plot(HypothesisSixFullSC, cex = 0.3, main = "6. Triphyletic Lissamphibia (Anuri and Caudata inside Temnospondyli,\nGymniophona inside Lepospondyli and Crown Lissamphibia paraphyletic to Amniota)")
dev.off()
