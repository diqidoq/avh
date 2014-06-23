#!/bin/bash
#
# 2012 (c) diqidoq, for MAROQQO digital media
#

err(){
cat << EOF

-----------------------------------------------------
Ups! ... Something missing here ? 
How to use avh (link): https://github.com/diqidoq/avh
-----------------------------------------------------

EOF
 }

if [[ "$1" =~ "-" ]] ; then

avaDir="/etc/apache2/sites-available";
avnDir="/etc/apache2/sites-enabled";

while getopts ":ane:d:l:xr" OPTION ; do

case $OPTION in
  a)
      cd ${avaDir}
      for file in * ; do 
	fname=$(basename "$file")
	echo "${avaDir}/$fname"
      done
      ;;
  n)
      cd ${avnDir}
      for file in * ; do 
	fname=$(basename "$file")
	echo "${avnDir}/$fname"
      done
      ;;
  e)
      if [ -z "$OPTARG" ]
        then
          err
      else
          sudo vim ${avaDir}/"$OPTARG"
      fi
      ;;
  d)
      if [ -z "$OPTARG" ]
        then
          err
       else
          echo "New filename: "
          read FILENAME
          sudo cp ${avaDir}/$OPTARG ${avaDir}/"$FILENAME"
      fi
      ;;
  l)
      if [ -z "$OPTARG" ]
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
          sudo bash -c "echo 127.0.0.1 $OPTARG >> /etc/hosts"
          # % echo "$2" | sudo tee -a /etc/hosts
          # sudo echo "$2" >> /etc/hosts
          echo "$OPTARG added to /etc/hosts file. If you haven't added option -r, run avh -r to restart Apache."
      fi
      ;;
   x)
      if [ -z "$OPTARG" ]
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
          sudo bash -c "sed -i -e '/$OPTARG/d' /etc/hosts"
      fi
      ;;
  r)
      sudo service apache2 restart
      ;;
  \?) 
      err
      exit 1
      ;;
  :) 
      err
      exit 1
      ;;
esac
done

else

err
exit 1

fi
