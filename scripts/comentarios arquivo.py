# -*- coding: cp1252 -*-
import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
#import conecta_remoto
import conecta
import sys
import re #emojis

### dados dos usu�rios casuais
GH_USER = "*********"#your github username
GH_PASSWD =  "******"#your github passwd


def get_json(url):
   #headers = {'Accept': 'application/vnd.github.v3.star+json'}
   resp = requests.get(url, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar_dados():
   #conecta.c.execute("SELECT owner, nome_projeto, number_pr, id from pr where merge = 'unmerged' and id >= 1111534314 order by 4 asc")
   with open('D:\Mestrado\Codigos_py\comentarios.txt', 'r') as file:
    for line in file:
      json_objs = get_json(line)
      #print(line)
      try:
         for PR in json_objs:
            usuario = str(PR['user']['login'])
            #projeto = linha[1]
            #owner = linha[0]
            criado = str(PR['created_at'])
            #numero_pr =linha[2]
            author_association = PR['author_association']
            corpo= PR['body']
            corpo=corpo.replace("'", "")
            #id_pr = int(linha[3])
            url = line[0:line.index('?')]

            #emoji_pattern = re.compile("["
            #  "\U0001F600-\U0001F64F"  # emoticons
            #  "\U0001F300-\U0001F5FF"  # symbols & pictographs
            #  "\U0001F680-\U0001F6FF"  # transport & map symbols
            #  "\U0001F1E0-\U0001F1FF"  # flags (iOS)
                                 #"]+", flags=re.UNICODE)
            
            #corpo = (emoji_pattern.sub(r'', corpo)) # no emoji

            #print ("insert into comentarios_pr (usuario, body, dt_comentario, author_association, url) values ('%s', '%s', '%s', '%s', %s')"%(usuario, corpo, criado, author_association, url))   
            conecta.c.execute ("insert into comentarios_pr (usuario, body, dt_comentario, author_association, url) values ('%s', '%s', '%s', '%s', '%s')"%(usuario, corpo, criado, author_association, url))   
            conecta.cnx.commit()
      except:
         print('erro na URL: '+ line)
