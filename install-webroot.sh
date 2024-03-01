#!/bin/sh
# SPDX-FileCopyrightText: 2023 Dirk Meyer
# SPDX-License-Identifier: Ruby

if test $# -lt 1
then
	echo "Usage: ${0##*/} /var/www/example.com" >&2
	exit 65
fi
webroot="${1}"
if test ! -d "${webroot}"
then
	echo "no such directory: ${webroot}"
	exit 69
fi

chown -R www-data:www-data: \
	dmarc.rhtml favicon.ico include minimal.css search.js \

rsync -a --ignore-existing \
	dmarc.rhtml favicon.ico include minimal.css search.js \
	"${webroot}/"

exit 0
# eof
