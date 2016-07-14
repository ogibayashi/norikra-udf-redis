require 'java'
require 'jedis-2.7.3.jar'
require 'commons-pool2-2.4.2.jar'
require 'inifile'

java_package 'jp.gr.java_conf.ogibayashi.norikra.udf'

class Redis  # FQDN: org.example.yourcompany.norikra.udf.MyUDF1

  ini_path = File.expand_path(File.dirname(__FILE__) + "/norikra-udf-redis.ini")
  if File.exists?(ini_path)
    ini = IniFile.load(ini_path)
    @@hostname = ini['redis-server']['hostname']
  end

  if @@hostname.nil?
    @@hostname = "localhost"
  end

  def self.connect
    begin
      Java::redis.clients.jedis.JedisPool.new(Java::redis.clients.jedis.JedisPoolConfig.new, @@hostname)
    rescue
      warn $! if @logger
    end
  end

  def self.pool
    @@pool || self.connect
  end

  @@pool = self.connect

  java_signature 'public long incr(String)'
  def self.incr(key)
    jedis = pool.getResource()
    ret = jedis.incr(key)
    jedis.close()
    ret
  end

  java_signature 'public long incrby(String, long)'
  def self.incrby(key, value)
    jedis = pool.getResource()
    ret = jedis.incrBy(key, value)
    jedis.close()
    ret
  end

  # set, get, del  are prefixed 'r' to avoid reserved words.

  java_signature 'public String rset(String, String)'
  def self.rset(key, value)
    jedis = pool.getResource()
    ret = jedis.set(key, value)
    jedis.close()
    ret
  end

  java_signature 'public String rget(String)'
  def self.rget(key)
    jedis = pool.getResource()
    ret = jedis.get(key)
    jedis.close()
    ret
  end

  java_signature 'public long rdel(String)'
  def self.rdel(key)
    jedis = pool.getResource()
    ret = jedis.del(key)
    jedis.close()
    ret
  end


end
