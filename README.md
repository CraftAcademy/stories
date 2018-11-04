# Torgny.io

A fork of [Stories](https://github.com/kenny-hibino/stories)

## Setup

### Redis

Redis must be installed on your localhost in order to run tests and if you want to start `rails s`

```
$ brew install redis
```

Usage
```
start: 
$ brew services start redis

stop: 
$ brew services stop redis

restart:
$ brew services restart redis
```

## Elasticsearch

2018-11-04: (Thomas) I had an issue with elesticsearch not returning any results. After some investigation, I managed to upgrade ES on Bonsai to ES VERSION 6.2.4

After that I deleted the running indices using the interactive console (you can list them with `GET /_cat/indices`). by:

```
DELETE /posts
DELETE /tags
DELETE /users
```

And then I reindexed the whole thing: 
```
Post.all.each {|obj| obj.__elasticsearch__.index_document}
User.all.each {|obj| obj.__elasticsearch__.index_document}
Tag.all.each {|obj| obj.__elasticsearch__.index_document}
```

## License
Stories is released under the [MIT License](https://opensource.org/licenses/MIT)
