library(ggplot2)
library(readxl)
commits_pr <- read_excel("comentarios_por_pr.xlsx",sheet = "Planilha1")
figure <- "D:\\Pesquisa\\replicacao saner\\analise\\comentarios_pr.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(qtde_comentario~number_pr,data=commits_pr,ylim=c(1,5)
        main="# Comentários nos PRs",
        outline=FALSE,
        xlab="Linguagens", ylab="# Comentários") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed")) 
  
dev.off()


#### Esses aqui não!!!!!
commits_pr <- read_excel("commits_pr.xlsx",sheet = "Planilha1")
figure <- "D:\\Pesquisa\\replicacao saner\\analise\\commits_pr.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
ggplot(commits_pr, outline=FALSE, aes(x=reorder(Linguagem, `# Commits`), 
                                      y=`# Commits`)) + geom_boxplot(outlier.colour=NA) +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed")) +
  ylab("(# commits)")+
  coord_cartesian(ylim = c(1, 5))+
  xlab("Programming Languages")
dev.off()


#### Esses aqui não!!!!!
ggplot(commits_pr, outline=FALSE, aes(x=reorder(Linguagem, `# Commits`), 
                       y=`# Commits`)) + geom_violin(outlier.colour=NA) +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed")) +
  ylab("(# commits)")+
  coord_cartesian(ylim = c(0, 5))+
  xlab("Programming Languages")+
  geom_violin(trim=FALSE)