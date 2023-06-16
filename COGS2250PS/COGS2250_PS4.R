#Gabriel Katzeff 45870853 6:20 12/10/22
rm(list = ls())

#Excercose 1
setwd("C:/Users/gabri/OneDrive - Macquarie University/Uni/Cognitive and Brain Sciences/COGS2250/PS4/SCT/01")
filename = '01_20220_unmaskedSCT_2022_Aug_03_1145.csv'
data = read.table(filename, header = TRUE, sep = ',')
View(data)

#Excercise 2
levels(data$type)
data$type=as.factor(data$type)
levels(data$type)
nrow(data[data$type=="",])
nrow(data[data$type=="Practice",])
nrow(data[data$type=="Nonword",])
nrow(data[data$type=="Critical",])
data=data[-c(177),]
tail(data)
expt = data[!data$type == "Practice",]

View(data)
nrow(expt[expt$Target_response.corr==0,])
(errors=nrow(expt[expt$Target_response.corr==0,]))
(perc_errors=errors/nrow(expt)*100)

expt$errorrate=perc_errors


#Excercise 3
str(expt)
(expt[1,])
df = subset(expt, select = -c(practice_16x1.thisN,    
                              practice_16x1.thisIndex,
                              Prime_stim.started,
                              Prime_stim.stopped,
                              Blank.started,
                              Blank.stopped,
                              Target_stim.started,
                              Target_stim.stopped,
                              sound_1.started,
                              sound_1.stopped,
                              ISI.started,
                              ISI.stopped,
                              key_resp_3.keys,
                              key_resp_3.rt, 
                              date,
                              expName,
                              psychopyVersion,
                              X))

View(df)

nrow(df[df$type == "Nonword",])
nrow(df[df$type == "Critical",])

critical=df[df$type=="Critical",]
nrow(critical[critical$type])
View(critical)

critical$condition=as.factor(critical$condition)
levels(critical$condition)

nrow(critical[critical$condition=="related",])
nrow(critical[critical$condition=="unrelated",])

related = critical[critical$condition=="related",]
unrelated = critical[critical$condition=="unrelated",]


(errors_related=nrow(related[related$Target_response.corr == 0,]))
(errors_unrelated=nrow(unrelated[unrelated$Target_response.corr == 0,]))

(perc_errors_related = errors_related/nrow(related)*100)
(perc_errors_unrelated = errors_unrelated/nrow(unrelated)*100)

errors=matrix(c(errors_related,perc_errors_related,errors_unrelated,perc_errors_unrelated),ncol=2)
colnames(errors)= c("Related","Unrelated")
rownames(errors)=c("N","%")
errors

critical$errorrate_percondition = ifelse(critical$condition == "related", perc_errors_related,
                                         ifelse(critical$condition == "unrelated", perc_errors_unrelated, NA))

correct = critical[critical$Target_response.corr == 1,]



View(correct)


correct$RT=correct$Target_response.rt*1000

mean(correct$RT)
sd(correct$RT)

min(correct$RT)
max(correct$RT)

(lower_cutoff = mean(correct$RT)-(3*sd(correct$RT)))
(higher_cutoff = mean(correct$RT)+(3*sd(correct$RT)))

nrow(correct[correct$RT<=lower_cutoff,])
(perc_trimmed_low = nrow(correct[correct$RT <= lower_cutoff,])/nrow(correct)*100)

nrow(correct[correct$RT >= higher_cutoff,])
(perc_trimmed_high = nrow(correct[correct$RT >= higher_cutoff,])/nrow(correct)*100)

correct$RT = replace(correct$RT, correct$RT>= higher_cutoff,higher_cutoff)

max(correct$RT)

correct$RT = replace(correct$RT, correct$RT <= lower_cutoff,lower_cutoff)

correct$perctrimmedlowRT = perc_trimmed_low
correct$perctrimmedhighRT = perc_trimmed_high

#--------------Exercise 8-------------
#-------Putting all this in a loop----
rm(list=ls())
setwd("C:/Users/gabri/OneDrive - Macquarie University/Uni/Cognitive and Brain Sciences/COGS2250/PS4/SCT/Trimmed")
DIR = "C:/Users/gabri/OneDrive - Macquarie University/Uni/Cognitive and Brain Sciences/COGS2250/PS4/SCT"
subjects = list.dirs(path=DIR, full.names=T, recursive = F)
for(subj in 1:length(subjects)){
  filename = dir(subjects[subj],pattern=".csv", full.names=TRUE)
  data = read.table(filename, header = TRUE, sep=',')
  data$type=as.factor(data$type)
  levels(data$type)
  nrow(data[data$type=="",])
  nrow(data[data$type=="Practice",])
  nrow(data[data$type=="Nonword",])
  nrow(data[data$type=="Critical",])
  data=data[-c(177),]
  tail(data)
  expt = data[!data$type == "Practice",]
  
  View(data)
  nrow(expt[expt$Target_response.corr==0,])
  (errors=nrow(expt[expt$Target_response.corr==0,]))
  (perc_errors=errors/nrow(expt)*100)
  
  expt$errorrate=perc_errors
  str(expt)
  
  (expt[1,])
  
  
  df = subset(expt, select = -c(practice_16x1.thisN,    
                                practice_16x1.thisIndex,
                                Prime_stim.started,
                                Prime_stim.stopped,
                                Blank.started,
                                Blank.stopped,
                                Target_stim.started,
                                Target_stim.stopped,
                                sound_1.started,
                                sound_1.stopped,
                                ISI.started,
                                ISI.stopped,
                                key_resp_3.keys,
                                key_resp_3.rt, 
                                date,
                                expName,
                                psychopyVersion,
                                X))
  
  View(df)
  
  nrow(df[df$type == "Nonword",])
  nrow(df[df$type == "Critical",])
  
  critical=df[df$type=="Critical",]
  nrow(critical[critical$type])
  
  View(critical)
  
  critical$condition=as.factor(critical$condition)
  levels(critical$condition)
  
  levels(critical$condition)
  
  nrow(critical[critical$condition=="related",])
  nrow(critical[critical$condition=="unrelated",])
  
  related = critical[critical$condition=="related",]
  unrelated = critical[critical$condition=="unrelated",]
  
  
  (errors_related=nrow(related[related$Target_response.corr == 0,]))
  (errors_unrelated=nrow(unrelated[unrelated$Target_response.corr == 0,]))
  
  (perc_errors_related = errors_related/nrow(related)*100)
  (perc_errors_unrelated = errors_unrelated/nrow(unrelated)*100)
  
  errors=matrix(c(errors_related,perc_errors_related,errors_unrelated,perc_errors_unrelated),ncol=2)
  colnames(errors)= c("Related","Unrelated")
  rownames(errors)=c("N","%")
  errors
  
  
  critical$errorrate_percondition = ifelse(critical$condition == "related", perc_errors_related,
                                           ifelse(critical$condition == "unrelated", perc_errors_unrelated, NA))
  
  correct = critical[critical$Target_response.corr == 1,]
  
  
  
  View(correct)
  
  
  correct$RT=correct$Target_response.rt*1000
  
  mean(correct$RT)
  sd(correct$RT)
  
  min(correct$RT)
  max(correct$RT)
  
  lower_cutoff = mean(correct$RT)-(3*sd(correct$RT))
  higher_cutoff = mean(correct$RT)+(3*sd(correct$RT))
  
  nrow(correct[correct$RT<=lower_cutoff,])
  (perc_trimmed_low = nrow(correct[correct$RT <= lower_cutoff,])/nrow(correct)*100)
  
  nrow(correct[correct$RT >= higher_cutoff,])
  (perc_trimmed_high = nrow(correct[correct$RT >= higher_cutoff,])/nrow(correct)*100)
  
  correct$RT = replace(correct$RT, correct$RT>= higher_cutoff,higher_cutoff)
  
  max(correct$RT)
  
  correct$RT = replace(correct$RT, correct$RT <= lower_cutoff,lower_cutoff)
  
  correct$perctrimmedlowRT = perc_trimmed_low
  correct$perctrimmedhighRT = perc_trimmed_high
  
  filename2 = paste("trimmed", dir(subjects[subj]), sep=",")
  write.table(correct,filename2,append=FALSE,quote=TRUE,sep=",",row.names=FALSE,col.names=TRUE)
}

df

#Week 9
rm(list=ls())
setwd("C:/Users/gabri/OneDrive - Macquarie University/Uni/Cognitive and Brain Sciences/COGS2250/PS4/SCT/Trimmed")
list = list.files(getwd(), pattern="trimmed*", full.names=FALSE) 

data_LDT = do.call("rbind", lapply(list, FUN = function(files){read.table(files, header = T, sep = ",")}))
data_LDT$task ="LDT"
data_LDT_clean = data_LDT[,c('condition', 'participant', "errorrate", 
                             'errorrate_percondition', "RT", "perctrimmedlowRT", "perctrimmedhighRT", 
                             "task")]

summary(data_LDT_clean$errorrate)
errorrate_cutoff = 15
nrow(data_LDT_clean[data_LDT_clean$errorrate >= errorrate_cutoff,])
higherrors = data_LDT_clean[which(data_LDT_clean$errorrate >= errorrate_cutoff), "participant"]
nrow(data_LDT_clean[data_LDT_clean$participant == 33,]) 
data_LDT_clean1 = data_LDT_clean[data_LDT_clean$participant != 33,]

library(reshape2)

LDT_wide_RT = dcast(data_LDT_clean1, participant + task + errorrate + perctrimmedlowRT +
                      perctrimmedhighRT ~ condition, value.var="RT", fun.aggregate = mean)
LDT_wide_error = dcast(data_LDT_clean1, participant + task + errorrate + perctrimmedlowRT +
                         perctrimmedhighRT ~ condition, value.var="errorrate_percondition", fun.aggregate = mean)

write.csv(LDT_wide_RT, file = "RTdatawide.csv", row.names = F)
write.csv(LDT_wide_error, file = "Errordatawide.csv", row.names = F)

