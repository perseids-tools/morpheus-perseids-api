require 'redis'
require 'json'

require_relative './parser'

class Morpheus
  REDIS = Redis.new

  def initialize(morphlib, executable, expiry)
    @morphlib = morphlib
    @executable = executable
    @expiry = expiry
  end

  def raw(word, latin: false, strict_case: true, verbs_only: false, verbose: false)
    cached(word, latin, strict_case, verbs_only, verbose)
  end

  def bamboo_xml(word, latin: false, strict_case: true, verbs_only: false, verbose: false)
    Parser.bamboo_xml(cached(word, latin, strict_case, verbs_only, verbose))
  end

  private

  attr_reader :morphlib, :executable, :expiry

  def cached(word, latin, strict_case, verbs_only, verbose)
    command = [executable, *options(latin, strict_case, verbs_only, verbose)]

    key = [word, command].to_json
    value = redis.get(key)

    return value if value

    morpheus(word, command).tap do |xml|
      redis.set(key, xml)
      redis.expire(key, expiry)
    end
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

  def redis
    REDIS
  end
end
