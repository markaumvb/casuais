# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta
import conecta_remoto
import sys

GH_USER = "******"#your github username
GH_PASSWD = "******"#your github passwd

def get_json(url):
   headers = {'Accept': 'application/vnd.github.cloak-preview'}
   resp = requests.get(url, headers = headers, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar():
   conecta_remoto.c.execute("select nome_projeto, owner, number_pr, user from pr where merge = 'unmerged' and nome_projeto = 'sshuttle' and dt_fechado is not null order by id")
   for linha in conecta_remoto.c.fetchall():
      url = 'https://api.github.com/repos/'+linha[1]+'/'+linha[0]+'/issues/'+linha[2]+'/events?page=1&per_page=100'
      json_objs = get_json(url)
      for PR in json_objs:
         try:
            #print(url)
            sha = PR['commit_id']
            data = str(PR['created_at'])
            usuario = linha[3]
            projeto = linha[0]
            owner = linha[1]
            if PR['commit_id'] is None:
               sha = 'sem'
            evento = PR['event']
            if PR['actor'] is None:
               usuario_evento = 'sem'
            else:
               usuario_evento = PR['actor']['login']
               
            conecta_remoto.c.execute ("INSERT INTO event_commit (usuario,projeto, owner, sha, data, number_pr, evento, usuario_evento) VALUES('%s', '%s', '%s', '%s', '%s','%s', '%s', '%s')" %(usuario, projeto, owner, sha, data, linha[2], evento, usuario_evento))
            conecta_remoto.cnx.commit()
         except:
            print(url)
