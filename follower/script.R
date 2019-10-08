###estrela PR
library(ggplot2)
library(readxl)
membros_projeto <- read_excel("follower/casuais_heuristica.xlsx", sheet = "membros_projeto")
merbros_org <- read_excel("follower/casuais_heuristica.xlsx", sheet = "membros_org")
owner <- read_excel("follower/casuais_heuristica.xlsx", sheet = "owner")

figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\follower\\periodo_membros_projeto.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=membros_projeto, dias~periodo,outline=FALSE,
        ylim=c(0,3000),
        ylab="Dias") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\follower\\periodo_membros_org.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=membros_org, dias~periodo,outline=FALSE,
         ylim=c(0,3000),
        ylab="Dias") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()



figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\follower\\periodo_owner.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=owner, dias~periodo,outline=FALSE,
         ylim=c(0,3000),
        ylab="Dias") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()
