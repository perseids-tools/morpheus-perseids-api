require 'spec_helper'

describe '/analysis/word (xml)' do
  let(:morphsvc) { fixture('morphsvc-xml.json') }

  before { header 'Accept', 'application/xml' }

  specify 'Greek analyses' do
    morphsvc['greek'].each do |word, xml|
      get "/analysis/word?lang=grc&engine=morpheusgrc&word=#{ERB::Util.url_encode(word)}"

      expect(last_response).to be_created
      expect(last_response.body).to be_equivalent_to(xml)
    end
  end

  specify 'Latin analyses' do
    morphsvc['latin'].each do |word, xml|
      get "/analysis/word?lang=lat&engine=morpheuslat&word=#{word}"

      expect(last_response).to be_created
      expect(last_response.body).to be_equivalent_to(xml)
    end
  end

  specify 'using la instead of lat for latin' do
    word = 'Arma'
    xml = morphsvc['latin'][word]

    get "/analysis/word?lang=la&engine=morpheuslat&word=#{word}"

    expect(last_response).to be_created
    expect(last_response.body).to be_equivalent_to(xml)
  end

  specify 'mixing engines' do
    word = 'Arma'
    xml = morphsvc['latin'][word]

    get "/analysis/word?lang=lat&engine=morpheusgrc&word=#{word}"

    expect(last_response).to be_created
    expect(last_response.body).to be_equivalent_to(xml)
  end

  specify 'empty response' do
    get '/analysis/word?lang=lat&engine=morpheusgrc&word=not-a-word'

    expect(last_response).to be_created

    xml = <<~XML
      <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
        <oac:Annotation xmlns:oac="http://www.openannotation.org/ns/" rdf:about="urn:TuftsMorphologyService:not-a-word:morpheuslat">
          <dcterms:creator xmlns:dcterms="http://purl.org/dc/terms/">
            <foaf:Agent xmlns:foaf="http://xmlns.com/foaf/0.1/" rdf:about="org.perseus:tools:morpheus.v1"/>
          </dcterms:creator>
          <dcterms:created xmlns:dcterms="http://purl.org/dc/terms/">2020-01-01T00:00:00.000000</dcterms:created>
          <oac:hasTarget>
            <rdf:Description rdf:about="urn:word:not-a-word"/>
          </oac:hasTarget>
          <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/"/>
        </oac:Annotation>
      </rdf:RDF>
    XML

    expect(last_response.body).to be_equivalent_to(xml)
  end

  specify 'unknown engine' do
    get '/analysis/word?lang=lat&engine=not-an-engine&word=test'

    expect(last_response).to be_not_found
    expect(last_response.body).to be_equivalent_to('<error>unknown engine</error>')
  end

  specify 'unsupported language' do
    get '/analysis/word?lang=not-a-language&engine=morpheusgrc&word=test'

    expect(last_response).to be_not_found
    expect(last_response.body).to be_equivalent_to('<error>unsupported language</error>')
  end
end
