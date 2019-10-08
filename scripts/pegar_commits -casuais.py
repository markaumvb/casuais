# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta_remoto
#import conecta
import sys

GH_USER = "*********"#your github username
GH_PASSWD =  "******"#your github passwd


def get_json(url):
   #headers = {'Accept': 'application/vnd.github.VERSION.sha'}
   resp = requests.get(url, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar():
   conecta_remoto.c.execute("select usuario, projeto, owner, projeto_id, usuario_id, number_pr, sha, id_pr from commits_casuais_marcus order by id_pr")
   for linha in conecta_remoto.c.fetchall():
      pagina = 0
      url = 'https://api.github.com/repos/'+linha[2]+'/'+linha[1]+'/commits/'+linha[6]+'?per_page=100&page=1'
      #print(url)
      json_objs = get_json(url)
      try:
         id_pr = linha[7]
         for PR in json_objs['files']:
            sha_arquivo = PR['sha']
            status = PR['status']
            additions = PR['additions']
            deletions = PR['deletions']
            changes = PR['changes']
            arquivo = PR['filename']
            
            conecta_remoto.c.execute ("INSERT INTO arquivos_commits3(projeto_id, usuario_id, number_pr, sha_principal, sha_arquivo, arquivo, status, additions, deletions, changes, id_pr)VALUES('%d', '%d', '%s', '%s', '%s', '%s', '%s', '%d', '%d', '%d', '%s')"%(linha[3], linha[4], linha[5], linha[6], sha_arquivo, arquivo, status, additions, deletions, changes, id_pr))
            conecta_remoto.cnx.commit()
      except:
         print(url)

   


