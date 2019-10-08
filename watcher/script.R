###estrela PR
library(ggplot2)
library(readxl)
watcher_pr_periodo <- read_excel("watcher/casuais_pr.xlsx", sheet = "agrupado_sem")

figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\watcher\\periodo.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=watcher_pr_periodo, dias~periodo,outline=FALSE,
        main="Quantidade de dias", ylim=c(0,2000),
        ylab="Dias") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()

