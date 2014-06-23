AVH - Apache virtual host helper
================================

*A little apache2 virtual host helper script (c) by diqidoq.*

> If you are new to this: More about Apache2 web server and virtual host setup basic knowledge can be found [here](http://httpd.apache.org/docs/2.2/de/vhosts/).

## Description

This small set of bash functions is intended to become a little Linux bash command line helper script for adding and removing virtual hosts and web project directories with a bunch of small and good ETR (easy to remember) terminal commands to run local domains on local development machines.

## How to

Move the script file into your (home/user/bin/...) and rename `avh.sh` to `avh` or use terminal command:

    mv avh.sh ~/bin/avh

Make sure that `~/bin/avh` is executable (permissions) and `~/bin` is accessable (permissions) and recorgnized by your terminal. If not, sometimes it helps to relog in to Linux user. 

AVH supports actions based on simple parameter flags, like `avh -a` or `avh -l`

    type avh -a : to list all available vhost conf files in path
    type avh -n : to list all enabled vhosts in enabled path
    type avh -e : to edit a new or existing conf file
    type avh -d : duplicate an available vhost conf file in path
    type avh -l : to append a local address to /etc/hosts file
    type avh -x : to remove a local address from /etc/hosts file
    type avh -r : to restart Apache2 server

    flags -e, -l and -d require second parameter (variable|path|name)

Run `avh -a` before `avh -e` or `avh -l` or `avh -d` to be in place and get command completion support.

## Dependencies

In the moment the script assumes that you are running a Debian-based Linux machine (like Ubuntu) with Apache 2 web server set up and located virtual host files under /etc/apache2/ (typically) and your command line tool is fine with bash scripts and you have [vim](http://www.vim.org/) terminal editor already installed. If not: `sudo apt-get install vim`.

---

Don't assume the script ready for guaranteed usability. This is an early attempt and will get some love from time to time.


---

AVH is published under the [GNU General Public License v3](http://www.gnu.org/copyleft/gpl.html).
AVH is made for Linux Apache2 development tasks and sponsored by [MAROQQO | digital media](http://www.maroqqo.com). Join us @ [twitter](http://twitter.com/maroqqo)

