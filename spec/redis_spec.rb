require 'norikra/udf_spec_helper'
include Norikra::UDFSpecHelper
require 'norikra/udf/redis'

# for single row UDF
describe Norikra::UDF::Incrby do
  udf_function Norikra::UDF::Incrby

  before do
    @jedis = Java::redis.clients.jedis.Jedis.new("localhost")
    @jedis.del("key1")
  end
  
  it 'increment value for a key' do
    key = "key1"

    r = fcall(:incrby, key, 1)
    expect(r).to eql(1)

    r = fcall(:incrby, key, 3)
    expect(r).to eql(4)
  end

end

describe Norikra::UDF::Incr do
  udf_function Norikra::UDF::Incr

  before do
    @jedis = Java::redis.clients.jedis.Jedis.new("localhost")
    @jedis.set("key1","1")
  end
  
  it 'increment value for a key' do
    key = "key1"

    r = fcall(:incr, key)
    expect(r).to eql(2)

    r = fcall(:incr, key)
    expect(r).to eql(3)
  end

end

describe Norikra::UDF::RSet do
  udf_function Norikra::UDF::RSet

  before do
    @jedis = Java::redis.clients.jedis.Jedis.new("localhost")
    @jedis.set("key1","aa")
  end
  
  it 'set a value for a key' do
    key = "key1"

    r = fcall(:rset, key, "bb")
    expect(r).to eql("OK")

    expect(@jedis.get(key)).to eql("bb")
  end

end

describe Norikra::UDF::RGet do
  udf_function Norikra::UDF::RGet

  before do
    @jedis = Java::redis.clients.jedis.Jedis.new("localhost")
    @jedis.set("key1","cc")
  end
  
  it 'get a value for a key' do
    key = "key1"

    r = fcall(:rget, key)
    expect(r).to eql("cc")
  end

end

describe Norikra::UDF::RDel do
  udf_function Norikra::UDF::RDel

  before do
    @jedis = Java::redis.clients.jedis.Jedis.new("localhost")
    @jedis.del("key1")
    @jedis.set("key1","dd")
  end
  
  it 'delete a value for a key' do
    key = "key1"

    r = fcall(:rdel, key)
    expect(r).to eql(1)
  end

end
