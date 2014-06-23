AVH - Apache virtual host helper
================================

*AVH is little apache2 virtual host helper script (c) by diqidoq.*

This small set of bash functions is intended to become a little Linux bash command line helper script for adding and removing virtual hosts and web project directories with a bunch of small and good ETR (easy to remember) terminal commands.

Move the script file into your (home/user/bin/...) and rename `avh.sh` to `avh` 

    mv avh.sh ~/bin/avh   

AVH supports actions based on simple parameter flags, like `avh -a` or `avh -h`   

    type avh -a : to list all available vhost conf files in path
    type avh -n : to list all enabled vhosts in enabled path
    type avh -e : to edit a new or existing conf file
    type avh -d : duplicate an available vhost conf file in path
    type avh -h : to append a local address to /etc/hosts file
    type avh -x : to remove a local address from /etc/hosts file
    type avh -r : to restart Apache2 server

    flags -e, -h and -d require a second parameter (name)

#### ! HINT: !
Run `avh -a` before `avh -e` or `avh -h` or `avh -d` to be in place and get command completion support.

---

Don't assume the script ready for guaranteed usability. This is an early attempt and will get some love from time to time.   

