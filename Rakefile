require 'rake'
require 'redis'

namespace :cache do
  redis = Redis.new

  desc 'Clear Redis cache'
  task :clear do
    redis.flushall
  end
end
