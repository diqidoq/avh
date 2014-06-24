AVH - Apache virtual host helper
================================

*A little apache2 virtual host helper script (c) by diqidoq.*

> If you are new to this: More about Apache2 web server and virtual host setup basic knowledge can be found [here](http://httpd.apache.org/docs/2.2/de/vhosts/).

## Description

This small set of bash functions is intended to become **a little Linux bash command line helper script for adding and removing virtual hosts and web project directory rootings** with a bunch of small and good ETR (easy to remember) terminal commands to run local domains on local development machines.

## How to

### Install version 1:

Move the `avh.sh` script file out of yor downloaded zip into your `~/bin` (home/user/bin/...) and rename `avh.sh` to `avh` or use terminal the following terminal command in **avh download folder root** to achieve this, if bin folder already exist:

    mv avh.sh ~/bin/avh

Make sure that `~/bin/avh` is executable (permissions) and `~/bin` is accessable (permissions) and recorgnized by your terminal. If not, sometimes it helps to relog in to Linux user.

### Install version 2:

Use the install.sh snippet to let it check if `~/bin` folder already exist and let it create it if not. It will also set the right permissions and will copy `avh.sh` to `~/bin/avh` and will make it executable. Simply run the following command from terminal in the **avh download folder root**:

    sh install.sh

### Using AVH:

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

## Dependencies

In the moment the script assumes that you are running a **Debian-based Linux machine (like Ubuntu)** with **Apache 2** web server set up and located virtual host files under `/etc/apache2/` (typically) and your command line tool is fine with bash scripts and you have [vim](http://www.vim.org/) terminal editor already installed. If not: `sudo apt-get install vim`.

---

Don't assume the script ready for guaranteed usability. This is an early attempt and will get some love from time to time.


---

AVH is published under the [GNU General Public License v3](http://www.gnu.org/copyleft/gpl.html).
AVH is made for Linux Apache2 development tasks and sponsored by [MAROQQO | digital media](http://www.maroqqo.com). Join us @ [twitter](http://twitter.com/maroqqo)

