#!/usr/bin/env ruby

DMARC_CSV_FILE = '/home/user/dmarc-report.csv'.freeze
DNS_CACHE_FILE = '/home/user/dmarc-dns.json'.freeze

# disable ACL per user
ADMIN_USER = nil

# enable ACL per user
# ADMIN_USER = 'admin'.freeze

GREEN_MX = [
  '2001:db8:1234::25', '192.0.2.0', # smtp.example.com
].freeze

# eof
