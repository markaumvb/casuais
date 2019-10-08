import urllib3
import requests
import json
import time
from requests.auth import HTTPBasicAuth
import conecta
import re #emojis
import time

#### coletar PR dos usu�rios casuais em outros projetos
GH_USER = "*******"#your github username
GH_PASSWD = "***********"#your github passwd

def get_json(url):
   resp = requests.get(url, auth=HTTPBasicAuth(GH_USER, GH_PASSWD)) 
   json_objs = resp.json()
   return json_objs

def pegar():
    qtde = 0
    conecta.c.execute("select user FROM pr where nome_projeto = 'elasticsearch' and merge = 'merged' and user >= 'smf%' and user not in ('KangYongKyun', 'lnwdr') group by user, nome_projeto having count(*) = 1 order by 1")
    for linha in conecta.c.fetchall():
      time.sleep(15) #esperar 20 segundos
      url = 'https://api.github.com/search/issues?q=is:pr+is:merged+author:'+linha[0]+'&per_page=100&page=1&sort=created_at&order=asc'
      usuario = linha[0]
      try:
         json_total = get_json(url)
         qtde = json_total['total_count']
       
         total_paginas_resto = qtde % 100 #resto
          
         if total_paginas_resto <> 0:
            qtde_execucoes = ((qtde/100) +1)
         else:
            qtde_execucoes = (qtde/100)
         pagina_executar= qtde

         json_objs = get_json(url)
         print(url)
      except:
         print('erro' + url)
      
      for dados in json_objs['items']:
           author_association = dados['author_association']
           comments = dados['comments']       
           url = dados['url']
           ultima_pagina = dados['created_at']
            
           conecta.c.execute ("insert into issue_casual (author_association, comments, url, usuario) values( '%s', '%d', '%s', '%s')" %(author_association, comments, url, usuario))
           conecta.cnx.commit()
      pagina_executar = pagina_executar - 100
      qtde_execucoes = qtde_execucoes -1

      for i in range(qtde_execucoes):
        #verificar quantidade de itens a serem buscar por página na última página
        if (pagina_executar > 100) and (pagina_executar>0):
           url = 'https://api.github.com/search/issues?q=author:'+linha[0]+'&per_page=100&page=1&sort=created_at:>'+ultima_pagina+'&per_page=100&page=1&sort=created&order=asc'
           #print(url)
        else:
           url = 'https://api.github.com/search/issues?q=author:'+linha[0]+'&per_page='+str(pagina_executar)+'&page=1&sort=created_at:>'+ultima_pagina+'&per_page='+str(pagina_executar)+'&page=1&sort=created&order=asc'   
        json_objs = get_json(url)

        time.sleep(15)
        for PR in json_objs['items']:
           author_association = dados['author_association']
           comments = dados['comments']       
           url = dados['url']
           ultima_pagina = dados['created_at']
           conecta.c.execute ("insert into issue_casual (author_association, comments, url, usuario) values( '%s', '%d', '%s', '%s')" %(author_association, comments, url, usuario))
           conecta.cnx.commit()
           
        
        pagina_executar = pagina_executar - 100
