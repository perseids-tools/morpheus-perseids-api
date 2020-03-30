require 'spec_helper'

describe '/engine' do
  let(:morphsvc) { fixture('morphsvc-engine-list.json') }

  specify 'json' do
    get '/engine'

    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq(JSON.parse(morphsvc['json']))
  end

  specify 'xml' do
    header 'Accept', 'application/xml'
    get '/engine'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morphsvc['xml'])
  end
end
