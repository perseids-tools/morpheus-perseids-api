require 'spec_helper'

describe '/raw' do
  let(:morpheus) { fixture('morpheus.json') }

  specify 'Greek noun' do
    get "/raw/greek/#{ERB::Util.url_encode('a)/nqrwpos')}"

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['a)/nqrwpos'])
  end

  specify 'Greek verb' do
    get '/raw/greek/poiei='

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['poiei='])
  end

  specify 'Latin noun' do
    get '/raw/latin/homo'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['homo -L'])
  end

  specify 'Latin verb' do
    get '/raw/latin/videor'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['videor -L'])
  end

  specify 'unknown' do
    get "/raw/greek/#{ERB::Util.url_encode('*pau/w')}"

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['*pau/w'])
  end

  specify 'strict case disabled' do
    get "/raw/greek/#{ERB::Util.url_encode('*pau/w')}?strict_case=false"

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['*pau/w -S'])
  end

  specify 'verbs only enabled' do
    get '/raw/latin/fero?verbs_only=true'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['fero -L -V'])
  end

  specify 'detailed output enabled' do
    get '/raw/greek/poiei=?verbose=true'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['poiei= -i'])
  end

  specify 'multiple arguments' do
    get '/raw/latin/fero?verbs_only=true&verbose=true'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['fero -L -V -i'])
  end

  specify 'multiple words' do
    get "/raw/latin/#{ERB::Util.url_encode('homo femina')}"

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(morpheus['homo femina -L'])
  end
end
