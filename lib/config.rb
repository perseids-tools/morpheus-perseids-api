module Config
  MORPHLIB = ENV.fetch('MORPHLIB') { 'stemlib' }
  EXECUTABLE = ENV.fetch('EXECUTABLE') { 'bin/cruncher' }
  PORT = ENV.fetch('PORT') { '1315' }
end
