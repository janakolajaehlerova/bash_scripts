create_accounts.sh 
- creates new account for students.
- needs files loginy_(group)(year).txt (logins) and lidi_(group)(year).txt (names)
- sets variables skupina (group), rok (year) and cislo_skupiny (GID)
- creates files passwd (add to /etc/passwd) and shawod (add to /etc/shadow), the rest is to copy and paste

create_passwords.sh
- for list of servers (servery.txt) sets root passwords.
- to be executed as ./create_passwords.sh > hesla.txt

email_sh.sh
- input files: servery.txt (list od servers), studenti.txt (list of students) and hesla.txt (output form ./create_passwords.sh)
- creates content of e-mail with name of the server and root password
