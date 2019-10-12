
library(readxl)
library(ggplot2)


geral_pr <- read_excel("contribuicoes_commit_pr.xlsx",sheet = "PR")
geral_commits <- read_excel("contribuicoes_commit_pr.xlsx",sheet = "Commit")

#contribuicoes  na linguagem x contribuidor 
dflist <- list (geral_pr, geral_commits)
#contribuicoes  na linguagem x contribuidor 
file.names <- c("PR", "Commits")
for(i in 1:length(file.names)){
  
  lapply(dflist[i], function(f)
  {
    x<- as.array(f$Qtde)
    x <- x[!x %in% boxplot.stats(x)$out]
    x <- x[!is.na(x)]
    
    figure <- paste("D:\\Pesquisa\\replicacao saner\\analise\\contribuidores_contribuicoes\\",file.names[i],".eps", sep="")
    setEPS()
    postscript(figure, width = 6, height = 4) #, pointsize = 1/100
    
    
    h <- hist(x, col="red", main=file.names[i], 
              ylab="# of contributors", xlab="# of contributions", 
              breaks=5, xlim=c(0,7), ylim=c(0,40000))
    rug(jitter(x))
    
    xfit<-seq(min(x),max(x),length=40)
    yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
    yfit <- yfit*diff(h$mids[1:2])*length(x)
    lines(xfit, yfit, col="black", lwd=2)
    dev.off()
  })
}





