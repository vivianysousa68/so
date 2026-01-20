# Etapa 1

# Atualize a lista de pacotes:
  sudo apt-get update

# Instale o pacote do servidor OpenSSH:
  sudo apt-get install openssh-serve
 
# Verifique o status do serviço:
  sudo systemctl status ssh

# saida
 Loaded: Loaded (/usr/lib/systemd/system/ssh.service; disabled; preset: enabled))


# Etapa 2

# Conectar ao servidor via SSH:
  ssh usuario@IP_DA_VM
  
# Confirme a autenticidade do host:
   Digite 'yes'
   
# Digite a senha:
 root


 # Etapa 3

# Faça backup do arquivo de configuração:
  sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp

# Abra o arquivo de configuração:
  sudo nano /etc/ssh/sshd_config

# Altere a porta padrão:
   Port 2244

# Desabilite o login de root:
   PermitRootLogin no

# Salve e feche o arquivo:
   Ctrl+O, Enter, Ctrl+X


# Etapa 4

# Reinicie o serviço SSH:
  sudo systemctl restart sshd

# Teste o acesso na nova porta:
  ssh vboxuser@10.0.2.15 -p 2244

# Teste o bloqueio do usuário root:
  ssh root@10.0.2.15 -p 2244
