require 'spec_helper'

describe '/analysis/word (options)' do
  let(:morphsvc) { fixture('morphsvc-options.json') }

  specify 'analyses' do
    morphsvc['greek'].each do |json|
      get "/analysis/word?lang=grc&engine=morpheusgrc&word=#{ERB::Util.url_encode(json['word'])}&#{json['options']}"

      expect(last_response).to be_created
      expect(JSON.parse(last_response.body)).to eq(JSON.parse(json['result']))
    end
  end
end
