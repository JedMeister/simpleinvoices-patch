#!/usr/bin/python
"""Set SimpleInvoices admin password and domain to serve

Option:
    --pass=  unless provided, will ask interactively # Not working yet
    --email= unless provided, will ask interactively
             DEFAULT=admin@example.com
"""

import sys
import getopt
import shutil
import md5
import random as random
import string

from dialog_wrapper import Dialog
from mysqlconf import MySQL

import os

def usage(s=None):
    if s:
        print >> sys.stderr, "Error:", s
    print >> sys.stderr, "Syntax: %s [options]" % sys.argv[0]
    print >> sys.stderr, __doc__
    sys.exit(1)

DEFAULT_EMAIL="admin@example.com"

def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], "h",
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


#    salt = "".join(random.choice(string.letters+string.digits) for line in range(1, 65))
#    salt = "this_is_the_encryption_key_change_it"
#    hash = md5.md5(password+':'+salt)
    hash = md5.md5(password)
    hashpass = hash.hexdigest()

    m = MySQL()
    m.execute('UPDATE simple_invoices.si_user SET password=\"%s\"  WHERE id=\"1\";' % hashpass)
    m.execute('UPDATE simple_invoices.si_user SET email=\"%s\" WHERE id=\"1\";' % email)
   
#Write to conf file (config.ini)
# Set some variables
    CONF_DIR = "/var/www/simpleinvoices/config/"
    CONF_FILE = CONF_DIR+"config.ini"
    BACKUP_FILE = CONF_FILE+".backup"
    TEMP_FILE = CONF_FILE+".tmp"
#    SALT_LINE = "encryption.default.key = "
#    NEW_SALT_LINE = SALT_LINE+salt+"\n"

# Backup conf
    shutil.copy2(CONF_FILE, BACKUP_FILE)

# Write new conf to temp file
    conf = open(CONF_FILE, "r")
    temp = open(TEMP_FILE, "w")
    temp.write(conf.readline())
    for line in conf:
#        if line.lstrip().startswith(SALT_LINE):
#            temp.write(NEW_SALT_LINE)
#        else:
            temp.write(line)
    conf.close()
    temp.close()

# Rename temp file (and overwrite old conf)
    shutil.move(TEMP_FILE, CONF_FILE)

if __name__ == "__main__":
    main()
