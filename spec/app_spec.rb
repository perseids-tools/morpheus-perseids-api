require 'spec_helper.rb'

describe 'greek' do
  it 'should respond with information about the word' do
    get '/greek/a)%2Fnqrwpos'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(fixture('anthropos.xml'))
  end
end

describe 'latin' do
  it 'should respond with information about the word' do
    get '/latin/homo'

    expect(last_response).to be_ok
    expect(last_response.body).to be_equivalent_to(fixture('homo.xml'))
  end
end
