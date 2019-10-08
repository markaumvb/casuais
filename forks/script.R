###estrela PR
library(ggplot2)
library(readxl)
forks_pr_periodo <- read_excel("forks/casuais_pr.xlsx", sheet = "agrupado")

figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\forks\\periodo_fork.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=forks_pr_periodo, dias_criou~periodo,outline=FALSE,
        main="Quantidade de dias", ylim=c(0,1250),
        ylab="Dias") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


####periodo pusshed
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\forks\\periodo_push.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=forks_pr_periodo, dias_pushe~periodo_pushed,outline=FALSE,
        main="Quantidade de dias", ylim=c(0,500),
        ylab="Dias") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()