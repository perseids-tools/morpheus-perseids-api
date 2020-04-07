#!/usr/bin/env ruby

require 'fileutils'
require 'tmpdir'
require 'json'

require_relative './utils'

# Values are from 0 to 1
# a training of 0.7 means 70% of data goes into training
# a validation of 0.8 and training 0.7 means 10% (0.8 - 0.7) goes into validation.
# Test should always be 1.0
training = 0.7
validation = 0.85
test = 1.0

repositories = {
  agldt: {
    url: 'https://github.com/PerseusDL/treebank_data.git',
    commit: '7100a6b86826e121c6205182429ee670db64a392',
    greek: '/v2.1/Greek/texts',
    latin: '/v2.1/Latin/texts',
  },
  gorman: {
    url: 'https://github.com/perseids-publications/gorman-trees.git',
    commit: '980941b4505a4edce13eb3c6d894adaeb2d602e0',
    greek: '/public/xml',
  },
  harrington: {
    url: 'https://github.com/perseids-publications/harrington-trees.git',
    commit: '91975acf3f34d51f3f925662116f4db7a54871c2',
    greek: '/public/xml/CITE_TREEBANK_XML/perseus/grctb',
    latin: '/public/xml/CITE_TREEBANK_XML/perseus/lattb',
  },
}

results = {
  greek: {
    training: [],
    validation: [],
    test: [],
  },
  latin: {
    training: [],
    validation: [],
    test: [],
  },
}

directory = Dir.mktmpdir
decider = Decider.new(training, validation, test)

`apt-get install -y git`

begin
  repositories.each do |name, repository|
    repository = Repository.new(name, repository)

    repository.checkout!(directory)
    repository.update_hash!(directory, decider, results)
  end
ensure
  FileUtils.remove_entry(directory)
end

File.open('./data/training/greek.json', 'w+') { |f| f.puts(results[:greek][:training].to_json) }
File.open('./data/training/latin.json', 'w+') { |f| f.puts(results[:latin][:training].to_json) }

File.open('./data/validation/greek.json', 'w+') { |f| f.puts(results[:greek][:validation].to_json) }
File.open('./data/validation/latin.json', 'w+') { |f| f.puts(results[:latin][:validation].to_json) }

File.open('./data/test/greek.json', 'w+') { |f| f.puts(results[:greek][:test].to_json) }
File.open('./data/test/latin.json', 'w+') { |f| f.puts(results[:latin][:test].to_json) }
