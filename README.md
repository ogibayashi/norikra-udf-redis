# Norikra::Udf::Redis

[Norikra](http://norikra.github.io/) UDF to execute operations on Redis. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'norikra-udf-redis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install norikra-udf-redis

## Usage

The following functions are provided.

| Function           | Result                                                                                 |
|--------------------|----------------------------------------------------------------------------------------|
| incr(key)          | Increments the number stored at key by one. Returns incremented value.                 |
| incrby(key, value) | Increments the number stored at key by the specified value. Returns incremented value. |
| rset(key, value)   | Set key to hold the string value. Returns "OK" if properly set.                        |
| rget(key)          |  Get the value of key. Returns the value                                               |
| rdel(key)          | Removes the specified key. Returns the number of removed keys. (maybe 1)               |

## Copyright

* Copyright (c) 2015- OGIBAYASHI Hironori
* License
    * GPL v2
