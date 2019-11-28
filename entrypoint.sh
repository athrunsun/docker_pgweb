#!/bin/sh

if [ $MULTIPLE_SESSIONS = '' ]; then
    if [ $SSL_MODE = '' ]; then
        /usr/bin/pgweb --bind=$BIND_ADDRESS --listen=$LISTEN_PORT --url postgres://$USER:$PASSWORD@$HOST:$PORT/$DATABASE
    else
        /usr/bin/pgweb --bind=$BIND_ADDRESS --listen=$LISTEN_PORT --url postgres://$USER:$PASSWORD@$HOST:$PORT/$DATABASE?sslmode=$SSL_MODE
    fi
else
    /usr/bin/pgweb --bind=$BIND_ADDRESS --listen=$LISTEN_PORT --sessions
fi
