casuais_linguagem1 <- read_excel("resultados.xlsx",sheet = "Planilha 19")
figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuicoes_casuais_por_linguagem\\grafico.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
b<-ggplot(casuais_linguagem1, aes(x=reorder(Language, percentages), y=percentages))
b+geom_point(aes(x=reorder(Language,Language), shape=factor(Method), color=factor(Method)))+
  theme_bw() +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed")) +
  ylab("(%)") +
  coord_cartesian(ylim=c(0,30)) + 
  xlab("Programming Languages") +
  labs(color = "Methods", shape = "Methods") +
  labs(title="Percentage of Casual Contributions")
dev.off()