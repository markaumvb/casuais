# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta
import sys
import re #emojis

### dados dos usuários casuais
GH_USER = "******"#your github username
GH_PASSWD = "*****"#your github passwd

def get_json(url):
   resp = requests.get(url, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar_dados():


   conecta.c.execute("select user FROM pr where nome_projeto = 'elasticsearch' and merge = 'merged' group by user, nome_projeto having count(*) = 1 order by 1")
   x = 0
   #try:  
   for linha in conecta.c.fetchall():
      url = 'https://api.github.com/users/'+linha[0]
      print(url)
      try:
         json_objs = get_json(url)

         followers = json_objs['followers']
         following = json_objs['following']
         identificacao = json_objs['id']
         nome_usuario = json_objs['login']
         public_gists = json_objs['public_gists']
         public_repos = json_objs['public_repos']
         x=x+1
         
         conecta.c.execute ("insert into usuario (followers, following, id, nome_usuario, public_gists, public_repos) values( '%d', '%d', '%d', '%s', '%d', '%d')" %(followers, following, identificacao, nome_usuario, public_gists, public_repos))
         conecta.cnx.commit()
      except:
         print("erro")
      print("Quantidade executada: " + str(x))


   
