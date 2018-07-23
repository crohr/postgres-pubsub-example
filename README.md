# Demo of postgres PubSub mechanism

A little-known feature of postgres is its LISTEN/NOTIFY mechanism, which will
allow you to implement a PubSub pattern easily, without the need for another
resource.

This example is largely based on
https://gist.github.com/chsh/9c9f5702919c83023f83, with a little change to
properly check out a connection from the ActiveRecord pool.

## Demo

    docker-compose build
    docker-compose up
