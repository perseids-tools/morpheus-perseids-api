require 'json'

require_relative './config'
require_relative './cache'
require_relative './parser'

class Morpheus
  CACHE = Cache.new

  def self.raw(word, **kwargs)
    Morpheus.new.raw(word, **kwargs)
  end

  def initialize(morphlib: Config::MORPHLIB, executable: Config::EXECUTABLE)
    @morphlib = morphlib
    @executable = executable
    @cache = Cache.new
  end

  def raw(word, latin: false, strict_case: true, verbs_only: false, verbose: false)
    cached(word, latin, strict_case, verbs_only, verbose)
  end

  private

  attr_reader :morphlib, :executable, :cache

  def cached(word, latin, strict_case, verbs_only, verbose)
    command = [executable, *options(latin, strict_case, verbs_only, verbose)]

    key = [word, command].to_json
    value = cache.get(key)

    return value if value

    cache.set(key, morpheus(word, command))
  end

  def morpheus(word, command)
    IO.popen({ 'MORPHLIB' => morphlib }, command, 'r+') do |io|
      io.puts(word)
      io.close_write
      io.read
    end
  end

  def options(latin, strict_case, verbs_only, verbose)
    [
      latin ? '-L' : nil,
      strict_case ? nil : '-S',
      verbs_only ? '-V' : nil,
      verbose ? '-i' : nil,
    ].compact
  end
end
