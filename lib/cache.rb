require 'redis'

require_relative './config'

class Cache
  REDIS = Redis.new

  def initialize(expiry: Config::EXPIRY, redis_enabled: Config::REDIS_ENABLED == 'true')
    @expiry = expiry
    @redis_enabled = redis_enabled

    @redis = Redis.new if redis_enabled
  end

  def get(key)
    redis_enabled ? redis.get(key) : nil
  end

  def set(key, value)
    return value unless redis_enabled

    value.tap do |v|
      redis.set(key, v)
      redis.expire(key, expiry)
    end
  end

  private

  attr_reader :expiry, :redis_enabled, :redis
end
