require_relative './parser'

class Morpheus
  OPTS = {
    'I' => '-i',
    'V' => '-V',
    'S' => '-S',
  }

  def initialize(morphlib, executable)
    @morphlib = morphlib
    @executable = executable
  end

  def response(word, opts, lang)
    Parser.parse(morpheus(word, opts, lang))
  end

  private

  attr_reader :morphlib, :executable

  def morpheus(word, opts, lang)
    command = [executable, *language_options(lang), *options(opts)]

    IO.popen({ 'MORPHLIB' => morphlib }, command, 'r+') do |io|
      io.puts(word)
      io.close_write
      io.read
    end
  end

  def language_options(lang)
    case lang
    when :Latin then ['-L']
    else []
    end
  end

  def options(opts)
    return [] unless opts

    opts.upcase.chars.uniq.map { |c| OPTS[c] }.compact.sort
  end
end
