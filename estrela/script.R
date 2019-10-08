library(ggplot2)
library(readxl)




####tentativas_pr
dados <- read_excel("tentativas_pr/casuais_heuristica.xlsx", sheet = "Geral")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\tentativas_pr\\periodo.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(1, 350))
dev.off()







#####comentarios (EM ISSUE)
dados <- read_excel("comentarios/casuais.xlsx", sheet = "comentario_issue")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\comentarios\\periodo_issue.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(1, 1800))
dev.off()


#####comentarios (EM PR)
dados <- read_excel("comentarios/casuais.xlsx", sheet = "comentario_pr")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\comentarios\\periodo_pr.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
coord_cartesian(ylim = c(1, 1000))

dev.off()








#####followers (membros_org)
dados <- read_excel("follower/casuais_heuristica.xlsx", sheet = "membros_org")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\follower\\periodo_membros_org.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(1, 3100))

dev.off()


#####followers (membros_proj)
dados <- read_excel("follower/casuais_heuristica.xlsx", sheet = "membros_projeto")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\follower\\periodo_membros_projeto.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(1, 3100))

dev.off()



#####followers (owners)
dados <- read_excel("follower/casuais_heuristica.xlsx", sheet = "owner")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\follower\\periodo_owner.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 5))

dev.off()









#####forks (fork)
dados <- read_excel("forks/casuais_heuristica.xlsx", sheet = "fork_sem")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\forks\\periodo_fork.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo_fork, y = dias_fork), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 1200))

dev.off()


#####forks (update)
dados <- read_excel("forks/casuais_heuristica.xlsx", sheet = "fork_sem")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\forks\\periodo_update.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo_update, y = dias_update), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 1600))

dev.off()



#####forks (push)
dados <- read_excel("forks/casuais_heuristica.xlsx", sheet = "fork_sem")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\forks\\periodo_push.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo_push, y = dias_push), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 800))

dev.off()








#####issue
dados <- read_excel("issue/casuais_heuristica.xlsx", sheet = "geral_todos_sem")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\issue\\periodo.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 850))

dev.off()





#####watcher
dados <- read_excel("watcher/casuais_heuristica.xlsx", sheet = "geral_sem")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\watcher\\periodo.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 1800))

dev.off()




#####estrela
dados <- read_excel("estrela/casuais_heuristica.xlsx", sheet = "geral_sem")
figure <- "D:\\Pesquisa\\primeira_pergunta\\Resultados2019\\estrela\\periodo.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100

p <- ggplot(dados, aes(x = periodo, y = dias), outline=FALSE) + 
  geom_boxplot(outlier.shape =NA)
p + theme_gray(base_size = 14) +
  ylab("# Dias")+ xlab("Período")+
  coord_cartesian(ylim = c(0, 1700))

dev.off()