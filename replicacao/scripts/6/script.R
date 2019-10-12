library(ggplot2)
library(readxl)

contribuicoes <- read_excel("contribuicoes_pr1.xlsx",sheet = "Planilha3")

figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_pr\\Comentarios.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=contribuicoes, comments~Classification, outline=FALSE,
        main="# Comments in PR", ylim=c(0, 10),
        ylab="Quantity") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_pr\\Review_comments.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=contribuicoes, review_comments~Classification, outline=FALSE,
        main="# Review Comments in PR", ylim=c(0, 10),
        ylab="Quantity") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_pr\\Commits.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=contribuicoes, commits~Classification, outline=FALSE,
        main="# Commits", ylim=c(0, 6),
        ylab="Quantity") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()

figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_pr\\adicoes.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=contribuicoes, additions~Classification, outline=FALSE,
        main="# additions", ylim=c(0, 180),
        ylab="Quantity") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_pr\\delecoes.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=contribuicoes, deletions~Classification, outline=FALSE,
        main="# deletions", ylim=c(0, 50),
        ylab="Quantity") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()



figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_pr\\change_files.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=contribuicoes, changed_files~Classification, outline=FALSE,
        main="# changed files", ylim=c(0, 8),
        ylab="Quantity") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()