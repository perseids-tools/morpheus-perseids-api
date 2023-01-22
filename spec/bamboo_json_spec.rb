require 'spec_helper'

describe '/analysis/word (json)' do
  let(:morphsvc) { fixture('morphsvc-json.json') }

  specify 'Greek analyses' do
    morphsvc['greek'].each do |word, json|
      get "/analysis/word?lang=grc&engine=morpheusgrc&word=#{ERB::Util.url_encode(word)}"

      expect(last_response).to be_created
      expect(JSON.parse(last_response.body)).to eq(JSON.parse(json))
    end
  end

  specify 'Latin analyses' do
    morphsvc['latin'].each do |word, json|
      get "/analysis/word?lang=lat&engine=morpheuslat&word=#{word}"

      expect(last_response).to be_created

      expect(JSON.parse(last_response.body)).to eq(JSON.parse(json))
      expect(JSON.parse(last_response.body)).to eq(JSON.parse(json))
    end
  end

  specify 'empty response' do
    get '/analysis/word?lang=lat&engine=morpheusgrc&word=not-a-word'

    expect(last_response).to be_created

    json = {
      'RDF' => {
        'Annotation' => {
          'about' => 'urn:TuftsMorphologyService:not-a-word:morpheuslat',
          'creator' => {
            'Agent' => {
              'about' => 'org.perseus:tools:morpheus.v1',
            },
          },
          'created' => {
            '$' => '2020-01-01T00:00:00.000000',
          },
          'hasTarget' => {
            'Description' => {
              'about' => 'urn:word:not-a-word',
            },
          },
          'title' => {},
        },
      },
    }

    expect(JSON.parse(last_response.body)).to eq(json)
  end

  specify 'unknown engine' do
    get '/analysis/word?lang=lat&engine=not-an-engine&word=test'

    json = {
      'error' => {
        '$' => 'unknown engine',
      },
    }

    expect(last_response).to be_not_found
    expect(JSON.parse(last_response.body)).to eq(json)
  end

  specify 'unsupported language' do
    get '/analysis/word?lang=not-a-language&engine=morpheusgrc&word=test'

    json = {
      'error' => {
        '$' => 'unsupported language',
      },
    }

    expect(last_response).to be_not_found
    expect(JSON.parse(last_response.body)).to eq(json)
  end
end
