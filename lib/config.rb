module Config
  MORPHLIB = ENV.fetch('MORPHLIB') { '/morpheus/stemlib' }
  EXECUTABLE = ENV.fetch('EXECUTABLE') { '/morpheus/bin/cruncher' }
  PORT = ENV.fetch('PORT') { '1315' }
end
