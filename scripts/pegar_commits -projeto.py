# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta
import sys
import conecta_remoto

GH_USER = "*********"#your github username
GH_PASSWD =  "******"#your github passwd

def get_json(url):
   headers = {'Accept': 'application/vnd.github.cloak-preview'}
   resp = requests.get(url, headers = headers, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar():
   x = 0
   conecta_remoto.c.execute("SELECT distinct nome_projeto, owner from pr where nome_projeto in ('php-src', 'xbmc') order by id asc")
   for linha in conecta_remoto.c.fetchall():
      pagina = 1
  
      url = 'https://api.github.com/repos/'+linha[1]+'/'+linha[0]+'/commits?until=2017-09-10 23:59:59&per_page=100&page=1'
      json_objs = get_json(url)
      while (json_objs != '') or (json_objs != {}) or (json_objs != 'NONE'):
         print(url)
         for PR in json_objs: 
            sha = PR['sha']
            data = str(PR['commit']['author']['date'])
            if (PR['author']['login'])=='null':
                usuario = 'NONE'
            else:
               usuario = PR['author']['login']
            #if (PR['author'] is None): #or (PR['author'] == {}):
               #usuario = 'NONE'
            #else:
            print(PR['author']['login'])
            print(x)
            #usuario= PR['author']['login']
            if (PR['committer'] is None) or (PR['committer'] == {}):
               commiter = 'NONE'
            else:
               commiter = PR['committer']['login']

            dt_aceito = str(PR['commit']['committer']['date'])
            x=x+1
            
            conecta.c.execute ("insert into commits_pr(usuario, projeto, owner, dt_commit, sha, commiter, data_aceito) values('%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(usuario, linha[0], linha[1],data, sha, commiter, dt_aceito))
            conecta.cnx.commit()
         pagina=pagina+1
         url = 'https://api.github.com/repos/'+linha[1]+'/'+linha[0]+'/commits?until=2017-09-10 23:59:59&per_page=100&page='+str(pagina)
         json_objs = get_json(url)  
         print('P�gina: ', str(pagina))
         if not json_objs:
            break
      

