require 'java'
require 'jedis-2.4.2.jar'
require 'commons-pool2-2.0.jar'

java_package 'jp.gr.java_conf.ogibayashi.norikra.udf'

class Redis  # FQDN: org.example.yourcompany.norikra.udf.MyUDF1
   begin
     @@pool = Java::redis.clients.jedis.JedisPool.new(Java::redis.clients.jedis.JedisPoolConfig.new, "localhost")
   rescue
     puts $!
   end

   java_signature 'public long incr(String)'
   def self.incr(key)
     jedis = @@pool.getResource()
     jedis.incr(key)
   end
   
   java_signature 'public long incrby(String, long)'
   def self.incrby(key, value)
     jedis = @@pool.getResource()
     jedis.incrBy(key, value)
   end

   # set, get, del  are prefixed 'r' to avoid reserved words.
   
   java_signature 'public String rset(String, String)'
   def self.rset(key, value)
     jedis = @@pool.getResource()
     jedis.set(key, value)
   end

   java_signature 'public String rget(String)'
   def self.rget(key)
     jedis = @@pool.getResource()
     jedis.get(key)
   end

   java_signature 'public long rdel(String)'
   def self.rdel(key)
     jedis = @@pool.getResource()
     jedis.del(key)
   end
   

end
