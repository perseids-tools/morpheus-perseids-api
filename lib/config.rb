module Config
  MORPHLIB = ENV.fetch('MORPHLIB') { '/morpheus/stemlib' }
  EXECUTABLE = ENV.fetch('EXECUTABLE') { '/morpheus/bin/morpheus' }
  PORT = ENV.fetch('PORT') { '1500' }
  EXPIRY = ENV.fetch('EXPIRY') { '604800' }
  REDIS_ENABLED = ENV.fetch('REDIS_ENABLED') { 'false' }
  REDIS_URL = ENV.fetch('REDIS_URL') { 'redis://127.0.0.1:6379/0' }
end
