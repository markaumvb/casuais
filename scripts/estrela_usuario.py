# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
#import conecta_remoto
import conecta
import sys

### dados dos usu�rios casuais
GH_USER = "*********"#your github username
GH_PASSWD =  "******"#your github passwd


def get_json(url):
   headers = {'Accept': 'application/vnd.github.v3.star+json'}
   resp = requests.get(url, headers = headers, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs


def pegar_dados():
   conecta.c.execute("SELECT DISTINCT (user) FROM pr WHERE merge = 'merged'  and user >= 'stickell' GROUP BY user, nome_projeto HAVING COUNT(*) = 1 order by 1")
   
   for linha in conecta.c.fetchall():
      x = 1
      url = 'https://api.github.com/users/'+linha[0]+'/starred?page='+str(x)+'&per_page=100&order=asc'

      json_objs = get_json(url)
      try:
         while json_objs <> []:
             executado = 0
             for ST in json_objs:
                 print('URL executada: ' + url)
                 print('executado: ' + str(executado))
                 starred = ST['starred_at']
                 projeto = ST['repo']['full_name']
                 usuario = linha[0]
                 conecta.c.execute ("insert into m_estrela (usuario, projeto, dt_estrela ) values ('%s', '%s', '%s')"%(usuario, projeto, starred))
                 conecta.cnx.commit()
                 executado = executado + 1
             x = x + 1
             url = 'https://api.github.com/users/'+linha[0]+'/starred?page='+str(x)+'&per_page=100&order=asc'
             json_objs = get_json(url)
             #print('final')
            # print(url)
      except:
         print('Erro na url: ' + url)

