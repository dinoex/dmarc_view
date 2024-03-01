#!/usr/bin/env ruby

# get a post variable
def get_post( cgi, name )
  val = cgi.params[ name ][ 0 ]
  return '' if val.nil?

  val
end

# test if a post variable is set
def test_post( cgi, name )
  val = cgi.params[ name ][ 0 ]
  return false if val.nil?

  true
end

# get the http user name passed from the webserver
def get_http_user
  if defined?( Apache )
    # mod_ruby installed
    r = Apache.request
    # authenticated users are safe
    user = r.connection.user
  else
    user = ENV.fetch( 'REMOTE_USER', nil )
    if user.nil?
      user = ENV.fetch( 'REDIRECT_REMOTE_USER', nil )
      if user.nil?
        puts 'Kein Benutzername'
        # p ENV
        exit 1
      end
    end
  end
  user
end

# eof
