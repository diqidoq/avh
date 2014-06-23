#!/bin/bash
#
# Copyright 2012: Digidog (aka. Sebastian Ugowsky) for MAROQQO digital media
#

 err(){
  echo
  echo "#######################################################"
  echo "#   AVH - Apache virtual host helper message:         #"
  echo "#   Error: No correct second argument supplied.       #"
  echo "#   Which list to show? Which conf to edit?           #"
  echo "#   Run avh --help to get more info/help about avh.   #"
  echo "#                               --Thanks (@Digidog)   #"
  echo "#######################################################"
  echo
 }
 help(){
  echo
  echo "+--------------------------------------------------------------+"
  echo "|            AVH - Apache virtual hosting helper               |"
  echo "|            ###################################               |"
  echo "|                                                              |"
  echo "| avh is little apache2 virtual host domain helper (@Digidog)  |"
  echo "| ===========================================================  |"
  echo "|                                                              |"
  echo "| Put AVH in ~/ & add alias avh='bash .avh.sh' to ~/.bashrc    |"
  echo "| AVH supports actions based on flags, like avh -a or avh -h   |"
  echo "|                                                              |"
  echo "| type avh -a : to list all available vhost conf files in path |"
  echo "| type avh -n : to list all enabled vhosts in enabled path     |"
  echo "| type avh -e : to edit a new or existing conf file            |"
  echo "| type avh -d : duplicate an available vhost conf file in path |"
  echo "| type avh -h : to append a local address to /etc/hosts file   |"
  echo "| type avh -x : to remove a local address from /etc/hosts file |"
  echo "| type avh -r : to restart Apache2 server                      |"
  echo "|                                                              |"
  echo "| flags -e, -h and -d require a second parameter (name)        |"
  echo "|                                                              |"
  echo "| ! HINT: !                                                    |"
  echo "| Run avh -a before -e -h -d to get name completion support    |"
  echo "+--------------------------------------------------------------+"
  echo
 }

case "$1" in
  -a)
      cd /etc/apache2/sites-available && ls -ash
      ;;
  -n)
      cd /etc/apache2/sites-enabled && ls -ash
      ;;
  -e)
      if [ -z "$2" ]
        then
          err
      else
          sudo vim /etc/apache2/sites-available/"$2"
      fi
      ;;
  -r)
      sudo service apache2 restart
      ;;
  -d)
      if [ -z "$2" ]
        then
          err
       else
          ORG="$2"
          echo "New filename: "
          read FILENAME
          sudo cp /etc/apache2/sites-available/$ORG /etc/apache2/sites-available/"$FILENAME"
      fi
      ;;
  -h)
      if [ -z "$2" ]
        then
          echo "    No host name given to append to /etc/hosts."
          echo "    Do you want to edit /etc/hosts manually using vim? <y/n>: "
          read YN
          if [ $YN == y ] ; then
            sudo vim /etc/hosts
            else
              err
          fi
      else
          sudo bash -c "echo 127.0.0.1 $2 >> /etc/hosts"
          # % echo "$2" | sudo tee -a /etc/hosts
          # sudo echo "$2" >> /etc/hosts
      fi
      ;;
   -x)
      if [ -z "$2" ]
        then
          echo "    No host name given to exclude from /etc/hosts."
          echo "    Do you want to edit /etc/hosts manually using vim? <y/n>: "
          read YN
          if [ $YN == y ]; then
            sudo vim /etc/hosts
            else
              err
          fi
      else
          sudo bash -c "sed -i -e '/$2/d' /etc/hosts"
      fi
      ;;
   0) help ;;
--help) help ;;
   *) err ;;
esac
