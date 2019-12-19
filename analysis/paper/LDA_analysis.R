# LDA-analysis
# we performed a linear discriminant analysis (LDA) based on the new shape variables (PCs), with a leave-one-out cross-validation procedure, to identify the linear combination of shape features that was able to discriminate between phases

# we work on PCA scores
bot.l <- LDA(op.p, 2)
# print a summary, along with the leave-one-out cross-validation table.
bot.l
# plot.LDA works pretty much with the same grammar as plot.PCA
# here we only have one LD
plot(bot.l)
# plot the cross-validation table
plot_CV(bot.l)

# Does not produce an efficient separation between groups and a cross-validation (leave-one-out) at phase level showing a low confidence in the reclassification. But best for Pre-e, indicating these have the most distinctive shapes

#--------------------------------------------------
# Unsupervised model-based clustering

# what are the best grouping of the pots by shape?
library(mclust)
BIC <- mclustBIC(op.p$x[ , 1:5])
mod1 <- Mclust(op.p$x[ , 1:5], x = BIC)
summary(mod1, parameters = TRUE)
plot(mod1, what = "classification")

# no clusters apparent

