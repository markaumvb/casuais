# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta_remoto
import conecta
import sys

### dados dos usu�rios casuais
GH_USER = "******"#your github username
GH_PASSWD = "******"#your github passwd

def get_json(url):
   headers = {'Accept': 'application/vnd.github.v3.star+json'}
   resp = requests.get(url, headers = headers, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs


def pegar_dados():
   conecta_remoto.c.execute("select login, name from g_projetos where name = 'sshuttle' order by name")
   
   for linha in conecta_remoto.c.fetchall():
      x = 1
      url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]
      json_objs = get_json(url)
      print(url)
      qtde_estrelas = json_objs['forks_count']
      qtde_execucao = (qtde_estrelas / 100)+1
      print('Quantidade de forks: '+str(qtde_estrelas))
      url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]+'/forks?page=1&per_page=100&sort=starred_at&order=asc'
      if qtde_estrelas <= 100:
         json_objs = get_json(url)
         try:
            for ST in json_objs:
               usuario = str(ST['owner']['login'])
               nome_fork = ST['full_name']
               criado = ST['created_at']
               atualizado = ST['updated_at']
               pushed_at=ST['pushed_at']
               projeto = linha[1]
               owner = linha[0]
               conecta_remoto.c.execute ("insert into m_fork (usuario, projeto, nome_fork, owner, dt_criado, dt_atualizado, dt_pushed) values('%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(usuario, projeto, nome_fork, owner, criado, atualizado, pushed_at))
               conecta_remoto.cnx.commit()
         except:
            print('Erro')
      else:
         json_objs = []
         json_objs = get_json(url)
         for i in range(qtde_execucao):
            print('Execu��o: ', str(x))
            url = 'https://api.github.com/repos/'+linha[0]+'/'+linha[1]+'/forks?page='+str(x)+'&per_page=100&order=asc'
            json_objs = get_json(url)
            x = x + 1
            try:
               for ST in json_objs:
                  usuario = str(ST['owner']['login'])
                  nome_fork = ST['full_name']
                  criado = ST['created_at']
                  atualizado = ST['updated_at']
                  pushed_at=ST['pushed_at']
                  projeto = linha[1]
                  owner = linha[0]
                  conecta_remoto.c.execute ("insert into m_fork (usuario, projeto, nome_fork, owner, dt_criado, dt_atualizado, dt_pushed) values('%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(usuario, projeto, nome_fork, owner, criado, atualizado, pushed_at))
                  conecta_remoto.cnx.commit()
            except:
               print('Erro - projeto:', linha[1])
               
