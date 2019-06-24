require(ggplot2)
require(GGally)
require(reshape2)
require(lme4)
require(compiler)
require(parallel)
require(boot)
require(lattice)
#install plse
require(caret)    
require(caTools)    
require(Deducer)
library(pROC)
  #pred_data_individual/

pred_data <- read.csv("C:/Users/Peter/Documents/MATLAB/all groups MID task/inge_feedback/pred_data_individual/pred_data_full_HC.csv")
m <- glmer(trial_type ~ IFG + ACC + CAU + PO +
             (1 | pred_data$subject_id), data = pred_data, family = binomial, control = glmerControl(optimizer = "bobyqa"),
           nAGQ = 10)

pred_data <- read.csv("C:/Users/Peter/Documents/MATLAB/all groups MID task/inge_feedback/pred_data_individual/pred_data_full_HC_drug.csv")
m <- glmer(trial_type ~ ACC +
             (1 | pred_data$subject_id), data = pred_data, family = binomial, control = glmerControl(optimizer = "bobyqa"),
           nAGQ = 10)

pred_data <- read.csv("C:/Users/Peter/Documents/MATLAB/all groups MID task/inge_feedback/pred_data_individual/pred_data_full_SIBs.csv")
m <- glmer(trial_type ~ ACC + IFG + CAU+
             (1 | pred_data$subject_id), data = pred_data, family = binomial, control = glmerControl(optimizer = "bobyqa"),
           nAGQ = 10)


# print the mod results without correlations among fixed effects
print(m, corr = FALSE)
summary(m)

#predict the probabilities for each of the datapoints
predictedval <- predict(m,newdata=pred_data,type='response')

#plot the ROCs 
  #version 1
#colAUC(predictedval, pred_data$trial_type, plotROC=TRUE, alg=c("Wilcoxon","ROC"))

  #version 2
roc_obj <- roc(pred_data$trial_type, predictedval)
auc(roc_obj)
plot(roc_obj, print.auc=FALSE, col="yellow", xlim=c(1, 0), ylim=c(0, 1), lwd = 4)



#####################################################

pred_data <- read.csv("C:/Users/Peter/Documents/MATLAB/all groups MID task/inge_feedback/pred_data_SDIs_drug.csv")

m <- glmer(trial_type ~ IFG + ACC + Pol + Por +
             (1 | pred_data$subject_id), data = pred_data, family = binomial, control = glmerControl(optimizer = "bobyqa"),
           nAGQ = 10)

pred_data <- read.csv("C:/Users/Peter/Documents/MATLAB/all groups MID task/inge_feedback/pred_data_SDIs.csv")
m <- glmer(trial_type ~ IFG + ACC + Pol + Por +
             (1 | pred_data$subject_id), data = pred_data, family = binomial, control = glmerControl(optimizer = "bobyqa"),
           nAGQ = 10)



# print the mod results without correlations among fixed effects
# print(m, corr = FALSE)
summary(m)

#predict the probabilities for each of the datapoints
predictedval <- predict(m,newdata=pred_data,type='response')

#plot the ROCs 
#version 1
#colAUC(predictedval, pred_data$trial_type, plotROC=TRUE, alg=c("Wilcoxon","ROC"))

#version 2
roc_obj2 <- roc(pred_data$trial_type, predictedval)
auc(roc_obj2)
lines(roc_obj2, print.auc=FALSE, col="darkred", xlim=c(1, 0), ylim=c(0, 1), lwd = 4)
grid(10, 10, lwd = 0)


deepskyblue1
firebrick1

#https://stackoverflow.com/questions/2564258/plot-two-graphs-in-same-plot-in-r

#http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf