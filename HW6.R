#Ūcsv���
polio<-read.csv("POLIO_Incidence.csv",stringsAsFactors = F)
head(polio)

#�N�e�����ର������A�H�~(YEAR)/�g(WEEK)����ǡA�U�{�Wcolumn�����ܪ�
library(reshape2) #for melt()
polio.m<-melt(polio,id.vars = c('YEAR','WEEK'))
head(polio.m)

polio.m[polio.m$value=="-",]$value<-NA #�B�z�ʭ�,�N"-"�ରNA
polio.m$value<-as.numeric(polio.m$value) #�Nvalue����ର�Ʀr
polio.sumYear<- #�U�{�U�~�ץ[�`�A�p��Ӧ~�ת��`�o�Ͳv
  aggregate(value~YEAR+variable,data=polio.m,FUN=sum,na.rm=F)
head(polio.sumYear)
#��ı�e�e�{
install.packages("ggplot2")
library(ggplot2)
myData<-qplot(data=polio.m,x=YEAR,y=value,color=variable,facets = ~variable)
#�H�~���@��X�b�A�o�Ͳv��Y�b�A�A�Q�Τ��P����a�����s
myData<- myData + stat_smooth(method="lm")
myData