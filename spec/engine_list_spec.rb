require 'spec_helper'

describe '/engine/:engine' do
  let(:morphsvc) { fixture('morphsvc-engine.json') }

  specify 'json' do
    morphsvc['json'].each do |engine, json|
      get "/engine/#{engine}"

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq(JSON.parse(json))
    end
  end

  specify 'xml' do
    morphsvc['xml'].each do |engine, xml|
      header 'Accept', 'application/xml'
      get "/engine/#{engine}"

      expect(last_response).to be_ok
      expect(last_response.body).to be_equivalent_to(xml)
    end
  end
end
