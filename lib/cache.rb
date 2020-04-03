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

    # If Redis goes down we don't want the application to stop working
    begin
      redis.set(key, value)
      redis.expire(key, expiry)
    rescue StandardError => e
      warn("Error: #{e}")
    end

    value
  end

  private

  attr_reader :expiry, :redis_enabled, :redis
end
