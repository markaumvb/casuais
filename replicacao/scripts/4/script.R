library(ggplot2)
library(readxl)

c_c <- read_excel("distribuicao_commit_pr.xlsx",sheet = "C")
c_cmais <- read_excel("distribuicao_commit_pr.xlsx",sheet = "C++")
c_clojure <- read_excel("distribuicao_commit_pr.xlsx",sheet = "clojure")
c_coffeescript <- read_excel("distribuicao_commit_pr.xlsx",sheet = "coffeescript")
c_erlang <- read_excel("distribuicao_commit_pr.xlsx",sheet = "erlang")
c_go <- read_excel("distribuicao_commit_pr.xlsx",sheet = "Go")
c_haskell <- read_excel("distribuicao_commit_pr.xlsx",sheet = "haskell")
c_java <- read_excel("distribuicao_commit_pr.xlsx",sheet = "java")
c_javascript <- read_excel("distribuicao_commit_pr.xlsx",sheet = "javascript")
c_objective <- read_excel("distribuicao_commit_pr.xlsx",sheet = "objective-c")
c_perl <- read_excel("distribuicao_commit_pr.xlsx",sheet = "perl")
c_php <- read_excel("distribuicao_commit_pr.xlsx",sheet = "php")
c_python <- read_excel("distribuicao_commit_pr.xlsx",sheet = "python")
c_ruby <- read_excel("distribuicao_commit_pr.xlsx",sheet = "ruby")
c_scala <- read_excel("distribuicao_commit_pr.xlsx",sheet = "scala")
c_typescript <- read_excel("distribuicao_commit_pr.xlsx",sheet = "typescript")



figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\C.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_c, percentages~Method, outline=FALSE,
  main=" C Projects", ylim=c(20,100),
   ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()



figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\C++.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_cmais, percentages~Method, outline=FALSE,
        main=" C++ Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()



figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Clojure.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_clojure, percentages~Method, outline=FALSE,
        main=" Clojure Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()



figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Coffeescript.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_coffeescript, percentages~Method, outline=FALSE,
        main=" Coffeescript Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()



figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Erlang.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_erlang, percentages~Method, outline=FALSE,
        main=" Erlang Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Go.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_go, percentages~Method, outline=FALSE,
        main=" Go Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Haskell.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_haskell, percentages~Method, outline=FALSE,
        main=" Haskell Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Java.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_java, percentages~Method, outline=FALSE,
        main=" Java Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Javascript.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_javascript, percentages~Method, outline=FALSE,
        main=" Javascript Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()

figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Objective-C.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_objective, percentages~Method, outline=FALSE,
        main=" Objective-C Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Perl.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_perl, percentages~Method, outline=FALSE,
        main=" Perl Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Scala.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_scala, percentages~Method, outline=FALSE,
        main=" Scala Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Typescript.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_typescript, percentages~Method, outline=FALSE,
        main=" Typescript Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Ruby.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_ruby, percentages~Method, outline=FALSE,
        main=" Ruby Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()


figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\Python.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_python, percentages~Method, outline=FALSE,
        main=" Python Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()

figure <- "D:\\Pesquisa\\replicacao saner\\analise\\contribuidoes_linguagem_boxplot\\PHP.eps"
setEPS()
postscript(figure, width = 6, height = 4) #, pointsize = 1/100
boxplot(data=c_php, percentages~Method, outline=FALSE,
        main=" PHP Projects", ylim=c(20,100),
         ylab="Percentages") +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
dev.off()