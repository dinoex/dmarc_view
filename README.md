# dmarc_view
This is the frontend for parsed DMARC reports

Backend and frontend should run on diffrent machines.
This avoids to have you IMAP credentials on the public webserver.
The cron-job push the results via rsync to the webserver.

## Requirements:
 * Install Ruby
 * Install erubis
 * Install Webserver with CGI support

### Example configuration for lighttpd:

````
server.modules += ( "mod_cgi" )
static-file.exclude-extensions += ( ".rb", ".rbx", ".rhtml" )
cgi.assign += ( ".rhtml" => "/usr/local/bin/eruby" )

server.document-root = "/var/www/example.com/"

$HTTP["url"] =~ "^/daten/" {
  url.access-deny = ( "" )
}
$HTTP["url"] =~ "^/include/" {
  url.access-deny = ( "" )
}
````

Helper script to log errors to a file.

````
vim /usr/local/bin/eruby
````

````
#!/bin/sh
LANG="de_DE.UTF-8"
export LANG
/usr/bin/erubis -E Stdout "${@}" 2>> /var/log/lighttpd/eruby-error.log
# eof
````

Add /var/log/lighttpd/eruby-error.log to your logrotate

## Installation:

Extract:

````
git clone git@github.com:dinoex/dmarc_view.git
````

Install files into your webroot:

````
mkdir /var/www/example.com
cd dmarc_view
./install-webroot.sh /var/www/example.com
````

Edir the configuration file:

````
vim /var/www/example.com/include/config.rbx
````

Set the full path to files generated by dmarc_report

````
DMARC_CSV_FILE = '/home/user/dmarc-report.csv'.freeze
DNS_CACHE_FILE = '/home/user/dmarc-dns.json'.freeze
````

If you don't need user control, set:

````
ADMIN_USER = nil
````

If you want user control, set
````
ADMIN_USER = 'admin'.freeze
````

To highlite your own servers in green, add your IP-addresses to the list:

````
GREEN_MX = [
  '2001:db8:1234::25', '192.0.2.0', # smtp.example.com
].freeze
````

## user control:

Configure AUTH on your webserver.
For each username create a file:

````
mkdir /var/www/example.com/daten
vim /var/www/example.com/daten/admin
````

After the Keyword 'Domain(s)' you need a TAB char
followed by the list of domains the user is allowed to see:

````
Domain(s)	example.net,example.com
````

## navigation

If you have mode modules you can extend the navigation line here:

````
vim /var/www/example.com/include/level-index.html
````

