import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta
#import re #emojis
import datetime

GH_USER = "*******"#your github username
GH_PASSWD = "*******"#your github passwd
linguagem = "DEFINIR LINGUAGEM"

merges = ["merged", "unmerged"]

def get_json(url):
   resp = requests.get(url, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def get_PR(repo, owner):
   #pegar os pulls requests de um projeto
    for merge in merges:
        url_total_pr = 'https://api.github.com/search/issues?q=is:pr+is:'+merge+'+repo:'+owner+'/'+repo+'&per_page=100&page=1&sort=created&order=asc'
        print(url_total_pr)
        json_total = get_json(url_total_pr)
        pull_count = json_total['total_count']
        #calcular páginas
        
        total_paginas_resto = pull_count % 100 #resto
        
        if total_paginas_resto <> 0:
           qtde_execucoes = ((pull_count/100) +1)
        else:
           qtde_execucoes = (pull_count/100)
        pagina_executar= pull_count

       #executar na primeira página e pegar o ultimo created_at e colocar na variavel ultima_Pagina

        print('Inicializando para os PRs: '+merge)
        url='https://api.github.com/search/issues?q=is:pr+is:'+merge+'+repo:'+owner+'/'+repo+'&per_page=100&page=1&sort=created&order=asc'
        json_objs = get_json(url)
        for PR in json_objs['items']:
          ###dados do usuario####
          user = str(PR['user']['login'])
          ######fim######
          ######dados do PR######
          id_git = PR['id']
          number = str(PR['number'])

          fechado = str(PR['closed_at'])
          if fechado <> 'None':
             fechado = fechado.replace('Z', '')
             fechado = fechado.replace('T', ' ')
          else:
             fechado = '0'
             
          criado = str(PR['created_at'])
          criado = criado.replace('Z', '')
          criado = criado.replace('T', ' ')
          ultima_pagina = PR['created_at']

                 

          ###gravar no banco de dados###
          if fechado <> '0':
             conecta.c.execute("insert into pr (owner, linguagem, user, nome_projeto, id_git, number_pr, merge, dt_criado, dt_fechado)values ('%s', '%s', '%s', '%s', '%d', '%s', '%s', '%s', '%s')"%(owner, linguagem, user, repo, id_git, number, merge, criado, fechado))
             #print(("insert into pr (owner, linguagem, user, nome_projeto, id_git, number_pr, state, merge, dt_criado, dt_fechado)values ('%s', '%s', '%s', '%s', '%d','%s', '%s', '%s', '%s', '%s')"%(owner, linguagem, user, repo, id_git, number, merge, criado, fechado)))
          else:
             conecta.c.execute ("insert into pr (owner, linguagem, user, nome_projeto, id_git, number_pr, merge, dt_criado)values ('%s', '%s', '%s', '%s', '%d','%s', '%s', '%s')"%(owner, linguagem, user, repo, id_git, number, merge, criado))
             #print(conecta.c.execute ("insert into pr (linguagem, user, type_user, id_git, number_pr, title, locked, merge, dt_criado) values ('%s', '%s', '%s', '%d', '%s', '%s', '%s', '%s', '%s')" %(linguagem, user, type_user, site_admin, repo, id_git, number, title, state, locked, merge, criado))  )
          
          conecta.cnx.commit()
        pagina_executar = pagina_executar - 100
        qtde_execucoes = qtde_execucoes -1

        for i in range(qtde_execucoes):
          print('P�gina: ' + str(i))
          #verificar quantidade de itens a serem buscar por página na última página
          if (pagina_executar > 100) and (pagina_executar>0):
             url='https://api.github.com/search/issues?q=is:pr+is:'+merge+'+repo:'+owner+'/'+repo+'+created:>'+ultima_pagina+'&per_page=100&page=1&sort=created&order=asc'
             print(url)
          else:
             url='https://api.github.com/search/issues?q=is:pr+is:'+merge+'+repo:'+owner+'/'+repo+'+created:>'+ultima_pagina+'&per_page='+str(pagina_executar)+'&page=1&sort=created&order=asc'   
          json_objs = get_json(url)
          
          for PR in json_objs['items']:

            
             ###dados do usuario####
             user = str(PR['user']['login'])
             ######fim######
             ######dados do PR######
             proj_url = PR['url']
             id_git = PR['id']
             number = str(PR['number'])

             fechado = str(PR['closed_at'])
             fechado = str(PR['closed_at'])
             if fechado <> 'None':
                fechado = fechado.replace('Z', '')
                fechado = fechado.replace('T', ' ')
             else:
                fechado = '0'
                
             criado = str(PR['created_at'])
             criado = criado.replace('Z', '')
             criado = criado.replace('T', ' ')

             ultima_pagina = PR['created_at']
             if fechado <> '0':
                conecta.c.execute("insert into pr (owner, linguagem, user, nome_projeto, id_git, number_pr, merge, dt_criado, dt_fechado)values ('%s', '%s', '%s', '%s', '%d', '%s', '%s', '%s', '%s')"%(owner, linguagem, user, repo, id_git, number, merge, criado, fechado))
                #print(("insert into pr (owner, linguagem, user, nome_projeto, id_git, number_pr, state, merge, dt_criado, dt_fechado)values ('%s', '%s', '%s', '%s', '%d','%s', '%s', '%s', '%s', '%s')"%(owner, linguagem, user, repo, id_git, number, merge, criado, fechado)))
             else:
                conecta.c.execute ("insert into pr (owner, linguagem, user, nome_projeto, id_git, number_pr, merge, dt_criado)values ('%s', '%s', '%s', '%s', '%d','%s', '%s', '%s')"%(owner, linguagem, user, repo, id_git, number, merge, criado))
                #print(conecta.c.execute ("insert into pr (linguagem, user, type_user, id_git, number_pr, title, locked, merge, dt_criado) values ('%s', '%s', '%s', '%d', '%s', '%s', '%s', '%s', '%s')" %(linguagem, user, type_user, site_admin, repo, id_git, number, title, state, locked, merge, criado))  )
          
             conecta.cnx.commit()
          
          pagina_executar = pagina_executar - 100
        print("#/#/#/#/#/ Fim de Execu��o!!! #/#/#/#/#/")
        print("Total de itens buscados: " + str(pull_count))

        conecta.c.execute("select count(*) from pr where nome_projeto= '%s' and merge = '%s'" %(repo, merge))
        qtde_banco =  conecta.c.fetchall()[0]
        print("Quantidade de itens inclu�dos no banco" + str(qtde_banco))
        print("fim do: " + merge)
