library(dplyr)
library(ggplot2)
library(reshape2)
library(plotly)

alcohol <- read.csv("data/drinks.csv")

#summary data alcohol
viewdata <- summary(alcohol)

#group by region sum by beer serving
regionsum <- alcohol%>%
             group_by(region)%>%
             summarise(sum_beer = sum(beer_servings))%>%
             ggplot(aes(x=region,y= sum_beer))+
             geom_col(col = "black", fill = "blue")+
             labs(title = "", x= "Region", y = "Beer Serving")+
             geom_text(aes(label = sum_beer), position = position_stack(vjust = 0.5), size= 5)+
             theme(axis.title.x = element_text(colour = "red",size = 12), 
                    axis.title.y = element_text(colour = "red",size = 12),
                    axis.text.x = element_text(size = 12))


#group by sub region sum by beer serving
subregionsum <- alcohol%>%
                group_by(sub.region)%>%
                summarise(sum_beer = sum(beer_servings))%>%
                ggplot(aes(x = sub.region, y = sum_beer))+
                geom_col(col = "black", fill = "blue")+
                labs(title = "", x= "Sub.region", y = "Beer Serving")+
                geom_text(aes(label = sum_beer), position = position_stack(vjust = 0.5), size= 2.5)+
                theme(axis.title.x = element_text(colour = "red",size = 12), 
                      axis.title.y = element_text(colour = "red",size = 12),
                      axis.text.x = element_text(size = 12, angle = 90, hjust = 1, vjust = 0.4))

#group by region use dodge bar
meltregion <- alcohol%>%
              group_by(region)%>%
              summarise(sum_beer = sum(beer_servings), sum_spirit = sum(spirit_servings), sum_wine = sum(wine_servings))%>%
              melt()
meltsumregion <- meltregion%>%
              ggplot(aes(x=region,y= value))+
              geom_bar(position = "dodge",aes(fill = meltregion$variable), stat= "identity", col = "grey")+
              scale_fill_discrete(name="",labels=c("Beer", "Spirit", "Wine"))+
              labs(title="", subtitle="", x= "Region", y = "Value")+
              geom_text(aes(label = meltregion$value, group = meltregion$variable),position = position_dodge(width = .9), vjust = 1.2, 
                        size = 3)+
              theme(axis.title.x = element_text(colour = "red",size = 12), 
                    axis.title.y = element_text(colour = "red",size = 12),
                    axis.text.x = element_text(size = 12, angle = 90, hjust = 1, vjust = 0.4))

#group by sub region use dodge bar 

meltsubregion <- alcohol%>%
                 group_by(sub.region)%>%
                 summarise(sum_beer = sum(beer_servings), sum_spirit = sum(spirit_servings), sum_wine = sum(wine_servings))%>%
                 melt()
meltsumsubregion <- meltsubregion%>%
                 ggplot(aes(x=sub.region,y= value))+
                 geom_bar(position = "dodge",aes(fill = meltsubregion$variable), stat= "identity", col = "grey")+
                 scale_fill_discrete(name="",labels=c("Beer", "Spirit", "Wine"))+
                 labs(title="", subtitle="", x= "sub region", y = "Value")+
                 geom_text(aes(label = meltsubregion$value, group = meltsubregion$variable),position = position_dodge(width = .9), vjust = 1.2, 
                           size = 3)+
                 theme(axis.title.x = element_text(colour = "red",size = 12), 
                        axis.title.y = element_text(colour = "red",size = 12),
                        axis.text.x = element_text(size = 12, angle = 90, hjust = 1, vjust = 0.4))
