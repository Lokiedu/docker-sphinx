FROM leodido/sphinxsearch:2.2.10

COPY sphinx.conf /usr/local/etc/sphinx.conf

CMD ["searchd.sh"]
