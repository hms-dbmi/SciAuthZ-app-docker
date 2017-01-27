FROM dbmi/pynxgu

COPY SciAuthZ /SciAuthZ/
RUN pip install -r /SciAuthZ/requirements.txt

RUN mkdir /entry_scripts/
COPY gunicorn-nginx-entry.sh /entry_scripts/
RUN chmod u+x /entry_scripts/gunicorn-nginx-entry.sh

COPY sciauthz.conf /etc/nginx/sites-available/pynxgu.conf

WORKDIR /

ENTRYPOINT ["/entry_scripts/gunicorn-nginx-entry.sh"]