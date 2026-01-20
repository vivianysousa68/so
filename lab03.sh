# Etapa 1 : Instalação do SAMBA

# Comando:
  sudo apt-get update
  sudo apt-get install samba


# Etapa 2 : Adicionar Usuários ao SAMBA

 # Comando:
   sudo smbpasswd -a dev_senior
   sudo smbpasswd -a dev_junior


# Etapa 3 : Adicionar Usuários ao SAMBA

 # Comando:
   sudo mkdir -p /srv/samba/publico
   sudo chown nobody:nogroup /srv/samba/publico
   sudo chmod 777 /srv/samba/publico


# Etapa 4 : Configurar os Compartilhamentos

 # Comando:
  sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp
  sudo nano /etc/samba/smb.conf
  
[Publico]
  comment = Compartilhamento Publico de Arquivos
  path = /srv/samba/publico
  browsable = yes
  writable = yes
  guest ok = yes
  read only = no
  
[Projetos]
  comment = Acesso restrito para a Equipe de Desenvolvimento
  path = /srv/projetos
  valid users = @desenvolvedores
  read only = no
  browsable = yes
  writable = yes


  # Etapa 5 : Reiniciar e Testar
  
   # Comando:
     sudo systemctl restart smbd
     sudo systemctl restart nmbd
     testparm

   # Saída
    active (running)

    [Publico]
      comment = compartilhamento Publico de Arquivo
      guest ok = yes
      path = /srv/samba/publico
      read only = no

   [Projetos] 
     comment = Acesso restrito para a Equipe de Desenvolvimento
     path = /srv/projetos 
     read only = no
     valid users = @desenvolvedores
