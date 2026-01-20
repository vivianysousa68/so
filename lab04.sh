# Etapa 1: Instalar e Configurar o Servidor Web (Apache)

# Atualize os pacotes e instale o Apache2:
  sudo apt-get update 
  sudo apt-get install apache2

# Crie uma página de teste simples:
  echo "<h1>Bem-vindo ao Servidor Web da Empresa!</h1>" | sudo
tee /var/www/html/index.html

# Teste o acesso via navegador:
    http://10.0.2.15


# Etapa 2: Instalar e Configurar o Servidor DNS (BIND9)
 
 #Instale o BIND9:
  sudo apt-get install bind9

 #Configure uma nova zona no BIND:
  sudo nano /etc/bind/named.conf.local
  #Adicione:
  zone "empresa.local" {
  type master;
  file "/etc/bind/db.empresa.local";
  };

 # Crie o arquivo da zona de pesquisa direta:
   sudo nano /etc/bind/db.empresa.local
   # Adicione (substitua IP_DA_VM pelo IP real):
$TTL 604800
@ IN SOA ns1.empresa.local. root.empresa.local. (
2 ; Serial
604800 ; Refresh
86400 ; Retry
2419200 ; Expire
604800 ) ; Negative Cache TTL
;
@ IN NS ns1.empresa.local.
ns1 10.0.2.15
www 10.0.2.15
