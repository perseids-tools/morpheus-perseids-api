require 'nokogiri'
require 'erb'
require 'net/http'

require_relative './attributes'
require_relative '../lib/parser'

class Requester
  def initialize(url = 'localhost', port: '1500')
    @url = url
    @port = port
  end

  def request(language, word)
    postags(Parser.new(word, latin: language == :latin).bamboo_json, language)
  end

  private

  attr_reader :url, :port

  # POStag generation code from:
  # https://github.com/alpheios-project/arethusa/blob/efc131d09b7405915034d2be092aa3d7edb6b063/app/js/arethusa.morph/services/morph.js#L98
  def postags(json, language)
    results = []

    make_array(get_body(json)).each do |element|
      next unless element

      entry = get_entry(element)
      lemma = get_lemma(entry)

      make_array(entry[:infl]).each do |form|
        results << [lemma, form_to_postag(form, language)]
      end
    end

    results
  end

  def flatten_attributes(form)
    form.each do |key, val|
      form[key] = val[:'$'] if val[:'$']
    end

    form
  end

  def rename_attributes(form)
    Attributes::ATTRIBUTE_MAP.each { |old_key, new_key| form[new_key] = form[old_key] }

    form
  end

  def rename_values(form)
    Attributes::VALUE_MAP.each do |category, actions|
      form[category] = actions[form[category]] if (actions[form[category]])
    end

    form
  end

  def make_array(object)
    return object if object.is_a?(Array)

    [object]
  end

  def get_body(json)
    json[:RDF][:Annotation][:Body]
  end

  def get_entry(element)
    element[:rest][:entry]
  end

  def get_lemma(entry)
    entry[:dict][:hdwd][:'$']
  end

  def postags_inflection(form)
    flatten_attributes(form)
    rename_attributes(form)
    rename_values(form)

    form
  end

  def form_to_postag(form, language)
    postags_inflection(form)

    attributes = language == :latin ? Attributes::Latin::ATTRIBUTE_MAP : Attributes::Greek::ATTRIBUTE_MAP

    Attributes::POSTAG_SCHEMA.map do |element|
      attribute_values = attributes.dig(element, :values) || {}
      value = form[element]

      postag_value(attribute_values, value)
    end.join('')
  end

  def postag_value(attribute_values, value)
    hash = attribute_values.values.find { |v| [v[:short], v[:long]].member?(value) }

    return hash[:postag] if hash

    '-'
  end
end

class Decider
  def initialize(training, validation, test)
    @training = training
    @validation = validation
    @test = test
    @random = Random.new(100)
  end

  def decision
    case random.rand
    when 0..training then :training
    when training..validation then :validation
    when validation..test then :test
    end
  end

  private

  attr_reader :training, :validation, :test, :random
end

class Repository
  def initialize(name, repository)
    @name = name
    @url = repository[:url]
    @commit = repository[:commit]
    @greek = repository[:greek]
    @latin = repository[:latin]
  end

  def checkout!(directory)
    `cd #{directory} && git clone #{url} #{name}`
    `cd #{directory}/#{name} && git checkout #{commit}`
  end

  def update_hash!(directory, decider, hash)
    update_hash_helper!("#{directory}/#{name}/#{greek}", decider, hash[:greek]) if greek

    update_hash_helper!("#{directory}/#{name}/#{latin}", decider, hash[:latin]) if latin

    hash
  end

  private

  attr_reader :name, :url, :commit, :greek, :latin

  def update_hash_helper!(directory, decider, list)
    Dir.glob("#{directory}/**/*.xml").each do |file|
      doc = Nokogiri::XML(File.read(file))
      doc.remove_namespaces!

      doc.xpath('//word').each do |word|
        list[decider.decision] << [word[:form], word[:lemma], word[:postag]] if real_word?(word)
      end
    end

    list
  end

  def real_word?(word)
    word[:form] =~ /[[:alpha:]]/
  end
end
