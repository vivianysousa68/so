# Etapa 1 : Configurar o Firewall com IPTABLES

# Crie um script chamado firewall.sh:
  nano firewall.sh

Cole o conteúdo:

#!/bin/bash
echo "Aplicando regras de firewall..."
# Limpa todas as regras antigas
Iptables-F
iptables -X
# Define a política padrão: bloquear tudo que entra
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
# Permite conexões já estabelecidas
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Permite acesso local
iptables -A INPUT -i lo -j ACCEPT
# SSH (porta 2244)
iptables -A INPUT -p tcp --dport 2244 -j ACCEPT
# Servidor Web (porta 80)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
# Servidor DNS (porta 53)
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
echo "Firewall configurado!"
iptables -L -n -v

# Salve, dê permissão de execução e rode o script:
  chmod +x firewall.sh
  sudo ./firewall.sh


# Etapa 2 : Instalar e Configurar o Proxy (Squid)

# Instale o Squid:
  sudo apt-get install squid

# Crie e edite a lista de sites bloqueados:
 sudo nano /etc/squid/sites_bloqueados.txt
 
Adicione:

.facebook.com
.twitter.com
.instagram.com

# Configure o squid.conf:
 sudo nano /etc/squid/squid.conf
 
Adicione no topo:

acl sites_bloqueados dstdomain "/etc/squid/sites_bloqueados.txt"
http_access deny sites_bloqueados


# Etapa 3 : Reiniciar e Testar

# Reinicie o Squid:
  sudo systemctl restart squid
  
# Teste do Firewall: De outra máquina, tente acessar uma porta não liberada (ex:
  telnetIP_DA_VM 1234). Deve falhar.
  
# Teste do Proxy: Configure navegador do cliente para usar proxy IP_DA_VM:3128 e:
 • Acesse google.com → deve abrir.
 • Acesse facebook.com → deve bloquear.
