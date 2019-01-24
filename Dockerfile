FROM mautic/mautic:apache

LABEL vendor="Powertic"
LABEL maintainer="Luiz Eduardo Oliveira Fonseca <luiz@powertic.com>"

ENV MAUTIC_RUN_CRON_JOBS false
ENV ANONIMIZE_IP 1
ENV TRACK_BY_IP 1
ENV TRACK_BY_URL 1
ENV TRACK_BY_FINGERPRINT 1

COPY local-template.php /var/www/
COPY docker-entrypoint.sh /entrypoint.sh

# Apply necessary permissions
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apache2-foreground"]
