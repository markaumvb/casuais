# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
#import conecta
import sys
#import re #emojis
import conecta_remoto


### executar este ap�s o arquivo pegar_pr... este script serve para atualizar informa��es coletadas dos PRs
GH_USER = "*********"#your github username
GH_PASSWD =  "******"#your github passwd


def get_json(url):
   resp = requests.get(url, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def atualizar_dados():

   conecta_remoto.c.execute("select owner, nome_projeto, number_pr, id from pr where (commits is null) and nome_projeto <> 'turbolinks' and id >1111321215 and id <=1111327040 order by id")#%(linguagem))
   x = 0
   #try:  
   for linha in conecta_remoto.c.fetchall():
      url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]+'/pulls/'+linha[2]
   
      #print(url)

      json_objs = get_json(url)
      try:
         codigo_pr = linha[3]
         qtde_commits = json_objs['commits']
         qtde_additions = json_objs['additions']
         qtde_deletions = json_objs['deletions']
         qtde_changed_files = json_objs['changed_files']
         author_association = json_objs['author_association']
         x=x+1

         conecta_remoto.c.execute ("update pr set commits = '%d', additions = '%d', deletions = '%d', changed_files = '%d', author_association = '%s' where id = '%s'" %(qtde_commits, qtde_additions,qtde_deletions, qtde_changed_files, author_association, codigo_pr))
         conecta_remoto.cnx.commit()
      except:
         print(url)   
      print("Quantidade executada: " + str(x))
      print(codigo_pr)
##   except Exception as e:
##      print('Erro')
      

   #percorrer a URL e pegar as informa��es necess�rias
##      sql = 'update teste set id_teste = ' + str(x) + ' where id_teste = ' +str(row[0])
##      x = x + 1
##      conecta.c.execute(sql)
##      conecta.cnx.commit()
    
