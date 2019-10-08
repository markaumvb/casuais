Regressão linear Multipla é uma generalização da linear simples (determinar uma variável independente através de uma variável) - a regressão linear simples esta contida na regressão linear múltipla.. mas não é possível dizer o contrário

variavel dependente: tentativa_pr
independentes : tentativas e comentários

Uso da variável dependente para explicar as variáveis indepententes

ex: a quantidade de tentativas de pr podem explicar as outras variáveis


p = 4 (quantidade de variável independente)

https://www.youtube.com/watch?v=F9afls6bfNQ








#regressão logística multilienar
summary(lm(dados$tentativa_antes ~ dados$com_antes + dados$com_depois 
           + dados$issue_antes + dados$issue_depois)) 

################################
summary(lm(dados$tentativa_depois ~ dados$com_antes + dados$com_depois 
           + dados$issue_antes + dados$issue_depois))



####################################################
dados_antes <- subset(dados, Grupos == "Antes")
summary(lm(dados_antes$tentativa_antes ~ dados_antes$com_antes + dados_antes$com_depois 
           + dados_antes$issue_antes + dados_antes$issue_depois)) 

#nivel de significância de 5% = 0.05
TA = 1.2088 + -0.0006C_ANTES + 0.0070C_DEPOIS + 0.0136I_ANTES + -0.0162I_DEPOIS
#ou seja, o comentário antes é maior que 0.05 (ultima coluna 0.21) e também a estimativa é muito próxima a 0

#modelo correto
summary(lm(dados_antes$tentativa_antes ~ dados_antes$com_depois 
           + dados_antes$issue_antes + dados_antes$issue_depois)) 

TA = 1.2085 + 0.0059 + 0.0124 + -0.0141, resumindo, 0.83% dos dados são explicados por este modelo


#não é possível
dados_depois <- subset(dados, Grupos == "Depois")
summary(lm(dados_depois$tentativa_depois ~ dados_depois$com_antes + dados_depois$com_depois 
           + dados_depois$issue_antes + dados_depois$issue_depois)) 



dados_antes_depois <- subset(dados, Grupos == "Antes e Depois")
summary(lm(dados_antes_depois$tentativa_depois + dados_antes_depois$tentativa_antes ~ dados_antes_depois$com_antes + dados_antes_depois$com_depois 
           + dados_antes_depois$issue_antes + dados_antes_depois$issue_depois)) 
#modelo correto:
summary(lm(dados_antes_depois$tentativa_depois + 
             dados_antes_depois$tentativa_antes ~ dados_antes_depois$com_depois)) 
#### 1.99% dos dados são explicados por este modelo


#não é possível
dados_nenhum <- subset(dados, Grupos == "Nenhum")
summary(lm(dados_nenhum$tentativa_depois + dados_nenhum$tentativa_antes ~ dados_nenhum$com_antes + dados_nenhum$com_depois 
           + dados_nenhum$issue_antes + dados_nenhum$issue_depois)) 