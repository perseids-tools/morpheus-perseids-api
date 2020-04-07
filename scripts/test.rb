#!/usr/bin/env ruby

require 'json'
require_relative './utils'

type = ARGV[0]

unless %w[training validation test].member?(type)
  puts('Usage: test.rb <training|validation|test>')
  exit
end

greek = JSON.parse(File.read("#{__dir__}/../data/#{type}/greek.json"))
latin = JSON.parse(File.read("#{__dir__}/../data/#{type}/latin.json"))

total_greek = greek.count
total_latin = latin.count

count_greek = 0
missing_greek = 0
any_greek = 0

count_latin = 0
missing_latin = 0
any_latin = 0

requester = Requester.new

def tags_equal?(tag, lemma, postag)
  # Sometimes the lemma numbers don't match but everything else does
  # I don't think this represents a real difference in most cases (e.g. ["ἰθύς", "a-p---fd-"] vs ["ἰθύς1", "a-p---fd-"])
  (lemma == tag[0] || lemma.sub(/\d+\z/, '') == tag[0].sub(/\d+\z/, '')) && postag == tag[1]
end

greek.each do |(word, lemma, postag)|
  lemma ||= ''
  postag ||= '---------'
  postags = requester.request(:greek, word)
  first_tag = postags.first

  if !first_tag
    missing_greek += 1
  elsif tags_equal?(first_tag, lemma, postag)
    count_greek += 1
    any_greek += 1
  elsif postags.any? { |pt| tags_equal?(pt, lemma, postag) }
    any_greek += 1
  end
end

latin.each do |(word, lemma, postag)|
  lemma ||= ''
  postag ||= '---------'
  postags = requester.request(:latin, word)
  first_tag = postags.first

  if !first_tag
    missing_latin += 1
  elsif tags_equal?(first_tag, lemma, postag)
    count_latin += 1
    any_latin += 1
  elsif postags.any? { |pt| tags_equal?(pt, lemma, postag) }
    any_latin += 1
  end
end

puts('Greek:')
puts("  Matches: #{count_greek}/#{total_greek}, #{(100 * count_greek / total_greek.to_f).round(2)}%")
puts("  Any match: #{any_greek}/#{total_greek}, #{(100 * any_greek / total_greek.to_f).round(2)}%")
puts("  Missing: #{missing_greek}/#{total_greek}, #{(100 * missing_greek / total_greek.to_f).round(2)}%")

puts('Latin:')
puts("  Matches: #{count_latin}/#{total_latin}, #{(100 * count_latin / total_latin.to_f).round(2)}%")
puts("  Any match: #{any_latin}/#{total_latin}, #{(100 * any_latin / total_latin.to_f).round(2)}%")
puts("  Missing: #{missing_latin}/#{total_latin}, #{(100 * missing_latin / total_latin.to_f).round(2)}%")

count_total = count_greek + count_latin
total_total = total_greek + total_latin
any_total = any_greek + any_latin
missing_total = missing_greek + missing_latin

puts('Total:')
puts("  Matches: #{count_total}/#{total_total}, #{(100 * count_total / total_total.to_f).round(2)}%")
puts("  Any match: #{any_total}/#{total_total}, #{(100 * any_total / total_total.to_f).round(2)}%")
puts("  Missing: #{missing_total}/#{total_total}, #{(100 * missing_total / total_total.to_f).round(2)}%")
