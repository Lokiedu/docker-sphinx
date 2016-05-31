#!/bin/bash
# Sphinx's searchd should be running for this to work

indexer -c /usr/local/etc/sphinx.conf --all --rotate

# wait a bit
# http://sphinxsearch.com/forum/view.html?id=11225
sleep 10

mysql -h0 -P9306 << SQL
ATTACH INDEX Geotags TO RTINDEX GeotagsRT;
ATTACH INDEX Hashtags TO RTINDEX HashtagsRT;
ATTACH INDEX Posts TO RTINDEX PostsRT;
ATTACH INDEX Users TO RTINDEX UsersRT;
ATTACH INDEX Schools TO RTINDEX SchoolsRT;
ATTACH INDEX Comments TO RTINDEX CommentsRT;
SQL
