# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta
import sys

GH_USER = "*********"#your github username
GH_PASSWD =  "******"#your github passwd


def get_json(url):
   headers = {'Accept': 'application/vnd.github.cloak-preview'}
   resp = requests.get(url, headers = headers, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar():
   #conecta.c.execute("select distinct user, nome_projeto, owner from pr where merge = 'unmerged' and nome_projeto not in ('node', 'spree') order by id asc")
   conecta.c.execute("select usuario, projeto, owner, count(*) from commits_pr group by projeto, usuario, owner having count(*)>=100")
   for linha in conecta.c.fetchall():
      url = 'https://api.github.com/search/commits?q=author:'+linha[0]+'+repo:'+linha[2]+'/'+linha[1]+'&page=1&per_page=100'
      json_objs = get_json(url)
      if 'message' in json_objs:
         continue
      else:
         if json_objs['total_count']==0:
            continue
         else:
            if json_objs['total_count']<100:
               
               for PR in json_objs['items']: 
                  usuario = PR['author']['login']
                  projeto = PR['repository']['name']
                  owner = PR['repository']['owner']['login']
                  criado=str(PR['commit']['author']['date'])
                  sha = PR['commit']['tree']['sha']
                  url = PR['url']
                  

                  conecta.c.execute ("insert into commits_pr_mais100 (usuario, projeto, owner, dt_criado, sha, url) values('%s', '%s', '%s', '%s', '%s', '%s')"%(usuario, projeto, owner, criado, sha, url))
                  conecta.cnx.commit()

            else:
               commit_count = json_objs['total_count'] - 100
               total_paginas_resto = commit_count % 100 #resto
              
               if total_paginas_resto <> 0:
                  qtde_execucoes = ((commit_count/100) +1)
               else:
                  qtde_execucoes = (commit_count/100)

               
               pagina = 2
               for i in range(qtde_execucoes):
                  
                  url = 'https://api.github.com/search/commits?q=author:'+linha[0]+'+repo:'+linha[2]+'/'+linha[1]+'&page='+str(pagina)+'&per_page=100'
                  json_ojbs = get_json(url)

                  #print (url)
                  
                  for PR in json_objs['items']:
                     usuario = PR['author']['login']
                     projeto = PR['repository']['name']
                     owner = PR['repository']['owner']['login']
                     criado=str(PR['commit']['author']['date'])
                     sha = PR['commit']['tree']['sha']
                     url = PR['url']
                    

                     conecta.c.execute ("insert into commits_pr_mais100 (usuario, projeto, owner, dt_criado, sha, url) values('%s', '%s', '%s', '%s', '%s', '%s')"%(usuario, projeto, owner, criado, sha, url))
                     conecta.cnx.commit()
                  pagina = pagina + 1
                  #print('adicionou pagina')

                   
               
         

