require 'rake'
require 'redis'

namespace :cache do
  redis = Redis.new

  task :clear do
    redis.flushall
  end
end
