#!/usr/bin/python
"""Set SimpleInvoices admin password and domain to serve

Option:
    --pass=  unless provided, will ask interactively # Not working yet
    --email= unless provided, will ask interactively
             DEFAULT=admin@example.com
"""

from sys import stderr, argv, exit
import getopt
import shutil
from hashlib import md5
from random import choice
from string import letters, digits

from dialog_wrapper import Dialog
from mysqlconf import MySQL

import os

def usage(s=None):
    if s:
        print >> stderr, "Error:", s
    print >> stderr, "Syntax: %s [options]" % argv[0]
    print >> stderr, __doc__
    exit(1)

DEFAULT_EMAIL="admin@example.com"

def main():
    try:
        opts, args = getopt.gnu_getopt(argv[1:], "h",
                                       ['help', 'pass=', 'email='])
    except getopt.GetoptError, e:
        usage(e)

    email = ""
    password = ""
    for opt, val in opts:
        if opt in ('-h', '--help'):
            usage()
        elif opt == '--pass':
            password = val
        elif opt == '--email':
            email = val

    if not email:
        if 'd' not in locals():
            d = Dialog('TurnKey Linux - First boot configuration')
        email = d.get_input(
            "SimpleInvoices Email/Username",
            "Enter the email address (username) for the SimpleInvoices Admin user).",
            DEFAULT_EMAIL)
    if email == "DEFAULT":
        email = DEFAULT_EMAIL

    if not password:
        d = Dialog('TurnKey Linux - First boot configuration')
        password = d.get_password(
            "SimpleInvoices Password",
            "Enter new password for the SimpleInvoices Admin account")

    hashpass = md5(password).hexdigest()

    m = MySQL()
    m.execute('UPDATE simple_invoices.si_user SET password=\"%s\"  WHERE id=\"1\";' % hashpass)
    m.execute('UPDATE simple_invoices.si_user SET email=\"%s\" WHERE id=\"1\";' % email)
   
#Write to conf file (config.ini)
# Set some variables
    CONF_DIR = "/var/www/simpleinvoices/config/"
    CONF_FILE = CONF_DIR+"config.ini"
    BACKUP_FILE = CONF_FILE+".backup"
    TEMP_FILE = CONF_FILE+".tmp"
    CHANGE_LINE = "encryption.default.key", "nonce.key"

# Backup conf
    shutil.copy2(CONF_FILE, BACKUP_FILE)

# Write new conf to temp file
    conf = open(CONF_FILE, "r")
    temp = open(TEMP_FILE, "w")
    temp.write(conf.readline())
    for line in conf:
        if line.lstrip().startswith(CHANGE_LINE[0]):
            encrpytkey = "".join(choice(letters+digits) for line in range(1, 32))
            newline = CHANGE_LINE[0]+" = "+encrpytkey+"\n"
            line = newline
        elif line.lstrip().startswith(CHANGE_LINE[1]):
            encrpytkey = "".join(choice(letters+digits) for line in range(1, 32))
            newline = CHANGE_LINE[1]+" = "+encrpytkey+"\n"
            line = newline
        temp.write(line)
        
    conf.close()
    temp.close()

# Rename temp file (and overwrite old conf)
    shutil.move(TEMP_FILE, CONF_FILE)

if __name__ == "__main__":
    main()
