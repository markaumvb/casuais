# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta_remoto
#import conecta
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
   conecta_remoto.c.execute("select login, name from g_projetos where name in( 'cphalcon', 'flask', 'mosh', 'zephir') order by name")
   
   for linha in conecta_remoto.c.fetchall():
      x = 1
      url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]
      json_objs = get_json(url)
      print(url)
      qtde_estrelas = json_objs['stargazers_count']
      qtde_execucao = (qtde_estrelas / 100)+1
      print('Quantidade de estrelas: '+str(qtde_estrelas))
      url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]+'/stargazers?page=1&per_page=100&sort=starred_at&order=asc'
      if qtde_estrelas <= 100:
         json_objs = get_json(url)
         try:
            for ST in json_objs:
               usuario = str(ST['user']['login'])
               starred = ST['starred_at']
               projeto = linha[1]
               owner = linha[0]
               conecta_remoto.c.execute ("insert into m_estrela2 (usuario, projeto, owner, dt_estrela ) values ('%s', '%s', '%s', '%s')"%(usuario, projeto, owner, starred))
               conecta_remoto.cnx.commit()
         except:
            print('Erro')
      else:
         json_objs = []
         json_objs = get_json(url)
         for i in range(qtde_execucao):
            print('Execu��o: ', str(x))
            url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]+'/stargazers?page='+str(x)+'&per_page=100&order=asc'
            json_objs = get_json(url)
            x = x + 1
            try:
               for ST in json_objs:
                  usuario = str(ST['user']['login'])
                  starred = ST['starred_at']
                  projeto = linha[1]
                  owner = linha[0]
                  ultimo_starred = starred
                  conecta_remoto.c.execute ("insert into m_estrela2 (usuario, projeto, owner, dt_estrela ) values ('%s', '%s', '%s', '%s')"%(usuario, projeto, owner, starred))
                  conecta_remoto.cnx.commit()
            except:
               print('Erro - projeto:', linha[1])
               
