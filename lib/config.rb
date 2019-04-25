module Config
  MORPHLIB = ENV.fetch('MORPHLIB') { '/morpheus/stemlib' }
  EXECUTABLE = ENV.fetch('EXECUTABLE') { '/morpheus/bin/morpheus' }
  PORT = ENV.fetch('PORT') { '1316' }
end
