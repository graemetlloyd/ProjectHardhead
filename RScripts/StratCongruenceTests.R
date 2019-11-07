# SCRIPT TO PERFORM STRAT CONGRUENCE TESTS ON EACH TREE

# Load metatree library:
library(metatree)
library(paleotree)
library(strap)

# Read full trees in:
HypothesisOneFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/FullTrees.tre")
HypothesisTwoFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/FullTrees.tre")
HypothesisThreeFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/FullTrees.tre")
HypothesisFourFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/FullTrees.tre")
HypothesisFiveFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/FullTrees.tre")
HypothesisSixFullMPTs <- read.tree("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/FullTrees.tre")

# Read in first appearance ages:
FirstAppearanceAges <- read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/AgeData/FirstAppearanceAgeData.txt", header = TRUE, stringsAsFactors = FALSE, row.names = 1)

# Add column names to first appearance ages:
colnames(FirstAppearanceAges) <- c("FAD", "LAD")

# Pool all trees together:
Trees <- c(HypothesisOneFullMPTs, HypothesisTwoFullMPTs, HypothesisThreeFullMPTs, HypothesisFourFullMPTs, HypothesisFiveFullMPTs, HypothesisSixFullMPTs)

# Perform strat congruence tests on pooled trees:
x <- StratPhyloCongruence(trees = Trees, ages = FirstAppearanceAges, hard = FALSE, randomly.sample.ages = TRUE, fix.topology = TRUE, fix.outgroup = TRUE, outgroup.taxon = "Acanthostega_gunnari")

# Write results tables to file:
write.table(x$input.tree.results, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/StratCongruenceResults/InputTreeResults.txt")
write.table(x$rand.permutations, "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/StratCongruenceResults/RandomTreeResults.txt")

# Write time-scaled trees to file:
ape::write.tree(x$input.trees[1:1000], "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisOne/Trees/FullTreesTS.tre")
ape::write.tree(x$input.trees[1001:2000], "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisTwo/Trees/FullTreesTS.tre")
ape::write.tree(x$input.trees[2001:3000], "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisThree/Trees/FullTreesTS.tre")
ape::write.tree(x$input.trees[3001:4000], "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFour/Trees/FullTreesTS.tre")
ape::write.tree(x$input.trees[4001:5000], "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisFive/Trees/FullTreesTS.tre")
ape::write.tree(x$input.trees[5001:6000], "~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/HypothesisSix/Trees/FullTreesTS.tre")

# Read back in data (so can run these lines again without re-doing strat congruence tests):
x <- list(input.tree.results = read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/StratCongruenceResults/InputTreeResults.txt", header = TRUE), rand.permutations = read.table("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/StratCongruenceResults/RandomTreeResults.txt", header = TRUE))

# Build boxplot data lists:
BoxPlotMIG <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "MIG"]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "MIG"]), HypothesisThree = unname(x$input.tree.results[2001:3000, "MIG"]), HypothesisFour = unname(x$input.tree.results[3001:4000, "MIG"]), HypothesisFive = unname(x$input.tree.results[4001:5000, "MIG"]), HypothesisSix = unname(x$input.tree.results[5001:6000, "MIG"]))
BoxPlotSCI <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "SCI"]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "SCI"]), HypothesisThree = unname(x$input.tree.results[2001:3000, "SCI"]), HypothesisFour = unname(x$input.tree.results[3001:4000, "SCI"]), HypothesisFive = unname(x$input.tree.results[4001:5000, "SCI"]), HypothesisSix = unname(x$input.tree.results[5001:6000, "SCI"]))
BoxPlotRCI <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "RCI"]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "RCI"]), HypothesisThree = unname(x$input.tree.results[2001:3000, "RCI"]), HypothesisFour = unname(x$input.tree.results[3001:4000, "RCI"]), HypothesisFive = unname(x$input.tree.results[4001:5000, "RCI"]), HypothesisSix = unname(x$input.tree.results[5001:6000, "RCI"]))
BoxPlotGER <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "GER"]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "GER"]), HypothesisThree = unname(x$input.tree.results[2001:3000, "GER"]), HypothesisFour = unname(x$input.tree.results[3001:4000, "GER"]), HypothesisFive = unname(x$input.tree.results[4001:5000, "GER"]), HypothesisSix = unname(x$input.tree.results[5001:6000, "GER"]))
BoxPlotMSMStar <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "MSM."]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "MSM."]), HypothesisThree = unname(x$input.tree.results[2001:3000, "MSM."]), HypothesisFour = unname(x$input.tree.results[3001:4000, "MSM."]), HypothesisFive = unname(x$input.tree.results[4001:5000, "MSM."]), HypothesisSix = unname(x$input.tree.results[5001:6000, "MSM."]))
BoxPlotGERStar <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "GER."]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "GER."]), HypothesisThree = unname(x$input.tree.results[2001:3000, "GER."]), HypothesisFour = unname(x$input.tree.results[3001:4000, "GER."]), HypothesisFive = unname(x$input.tree.results[4001:5000, "GER."]), HypothesisSix = unname(x$input.tree.results[5001:6000, "GER."]))
BoxPlotGERt <- list(HypothesisOne = unname(x$input.tree.results[1:1000, "GERt"]), HypothesisTwo = unname(x$input.tree.results[1001:2000, "GERt"]), HypothesisThree = unname(x$input.tree.results[2001:3000, "GERt"]), HypothesisFour = unname(x$input.tree.results[3001:4000, "GERt"]), HypothesisFive = unname(x$input.tree.results[4001:5000, "GERt"]), HypothesisSix = unname(x$input.tree.results[5001:6000, "GERt"]))

# Plot boxplots to PDF:
pdf("~/Documents/Publications/in prep/Temnospondyl Supertree 2 - Dan/ProjectHardhead/BoxPlots/StratCongruenceMeasure.pdf", width = 12, height = 7, useDingbats = FALSE)
boxplot(BoxPlotMIG, ylab = "Minimum Implied Gap", main = "Minimum Implied Gap", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
#axis(1, lwd = 1.5, at = 1:6, labels = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), par(cex = 1.5))
#axis(2, lwd = 1.5, at = c(7400, 7800, 8200, 8600), par(cex = 1.5))
#box(lwd = 1.5)
boxplot(BoxPlotSCI, ylab = "Stratigraphic Consistency Index", main = "Stratigraphic Consistency Index", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
boxplot(BoxPlotRCI, ylab = "Relative Completeness Index", main = "Relative Completeness Index", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
boxplot(BoxPlotGER, ylab = "Gap Excess Ratio", main = "Gap Excess Ratio", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
boxplot(BoxPlotMSMStar, ylab = "Manhattan Stratigraphic Measure*", main = "Manhattan Stratigraphic Measure*", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
boxplot(BoxPlotGERStar, ylab = "Gap Excess Ratio*", main = "Gap Excess Ratio*", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
boxplot(BoxPlotGERt, ylab = "Gap Excess Ratiot", main = "Gap Excess Ratiot", names = c(expression('H'[1]), expression('H'[2]), expression('H'[3]), expression('H'[4]), expression('H'[5]), expression('H'[6])), pch = 20, cex = 1.5, lwd = 1.5, cex.axis = 1.5, cex.lab = 1.5, cex.main = 1.5, axes = TRUE)
dev.off()
