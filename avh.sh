#!/bin/bash
#
# AVH 2012 (c) diqidoq, for MAROQQO digital media
##################################################

AVHversion(){ echo "AVH beta 0.3 "$(date +%y%m%d) ; }

AVHhelp(){
cat << EOF
AVH - Apache virtual host helper
================================
AVH supports actions based on simple -options, like `avh -a` or `avh -l`

    'avh -a'         list all virtual host conf files available (use this first)
    'avh -n'         list all virtual host conf files enabled
    'avh -e'         edit a new or existing conf file
    'avh -d'         duplicate a virtual host conf file available
    'avh -i'         list all ip 127.0.0.1 entries from etc/hosts file
    'avh -l'         append a local address to /etc/hosts file
    'avh -x'         remove a local address from /etc/hosts file
    'avh -r'         restart Apache2 server
    'avh -h' or
    'avh --help'     for help page (this)
    'avh -v' or
    'avh --version'  for showing version number and where installed

    flags -e, -l and -d require second parameter (variable|path|name)

EOF
}

AVHerr(){
cat << EOF
-------------------------------------------------------
| Ups! ... Something missing here ? Options ?         |
| How to use avh: avh --help  or visit GitHub README: |
| (link): https://github.com/diqidoq/avh              |
-------------------------------------------------------
EOF
 }

if [ -z "$@" ] ; then
AVHerr
exit 1
fi

avaDir="/etc/apache2/sites-available";
avnDir="/etc/apache2/sites-enabled";

# getopts and getopt are no options here to handle our needs on all systems
while test $# -gt 0 ; do
  case $1 in
  -h | --help)
      AVHhelp
  ;;
  -v | --version)
      AVHversion
  ;;
  -a)
      cd ${avaDir}
      for file in * ; do
	fname=$(basename "$file")
	echo "${avaDir}/$fname"
      done
      ;;
  -n)
      cd ${avnDir}
      for file in * ; do
	fname=$(basename "$file")
	echo "${avnDir}/$fname"
      done
      ;;
  -e)
      if [ -z "$OPTARG" ]
        then
          AVHerr
      else
          sudo vim ${avaDir}/"$OPTARG"
      fi
      ;;
  -d)
      if [ -z "$OPTARG" ]
        then
          AVHerr
       else
          echo "New filename: "
          read FILENAME
          sudo cp ${avaDir}/$OPTARG ${avaDir}/"$FILENAME"
      fi
      ;;
  -i)
      sed -n -e '/^127.0.0.1/p' /etc/hosts
      ;;
  -l)
      if [ -z "$OPTARG" ]
        then
          echo "    No host name given to append to /etc/hosts."
          echo "    Do you want to edit /etc/hosts manually using vim? <y/n>: "
          read YN
          if [ $YN == y ] ; then
            sudo vim /etc/hosts
            else
              AVHerr
          fi
      else
          sudo bash -c "echo 127.0.0.1 $OPTARG >> /etc/hosts"
          echo "$OPTARG added to /etc/hosts file. If you haven't added option -r, run avh -r to restart Apache."
      fi
      ;;
   -x)
      if [ -z "$OPTARG" ]
        then
          echo "    No host name given to exclude from /etc/hosts."
          echo "    Do you want to edit /etc/hosts manually using vim? <y/n>: "
          read YN
          if [ $YN == y ]; then
            sudo vim /etc/hosts
            else
              AVHerr
          fi
      else
          sudo bash -c "sed -i -e '/$OPTARG/d' /etc/hosts"
      fi
      ;;
  -r | --restart)
      sudo service apache2 restart
      ;;
  --)
      break
      ;;
  --*)
      AVHerr
      ;;
  -?)
      AVHerr
      ;;
  -*)
  # let's make options make easier to use, type -anr instead of -a -n -r
      split=$1
      shift
      set -- $(echo "$split" | cut -c 2- | sed 's/./-& /g') "$@"
      continue
      ;;
  *)
      break
      ;;
  esac

  shift
done
