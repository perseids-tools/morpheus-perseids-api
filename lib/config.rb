module Config
  MORPHLIB = ENV.fetch('MORPHLIB') { 'stemlib' }
  EXECUTABLE = ENV.fetch('EXECUTABLE') { 'bin/cruncher' }
end
