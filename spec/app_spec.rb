require File.expand_path('spec_helper.rb', __dir__)

class MorphMock
  def initialize(word)
    @word = word
    @close_write = false
    @puts = false
  end

  def puts(word)
    raise 'Error: puts already called or unexpected word given' if @word != word || @puts

    @puts = true
  end

  def close_write
    raise 'Error: close_write already called' if @close_write

    @close_write = true
  end

  def read
    return "<words>#{@word}</words>" if @close_write && @puts

    raise 'Error: puts or close_write not called'
  end
end

describe 'Morphology lookup' do
  before do
    allow(IO).to receive(:popen).with(
      { 'MORPHLIB' => '/morpheus/stemlib' },
      ['/morpheus/bin/morpheus'],
      'r+',
    ).and_yield(MorphMock.new('a'))

    allow(IO).to receive(:popen).with(
      { 'MORPHLIB' => '/morpheus/stemlib' },
      ['/morpheus/bin/morpheus', '-L'],
      'r+',
    ).and_yield(MorphMock.new('b'))

    allow(IO).to receive(:popen).with(
      { 'MORPHLIB' => '/morpheus/stemlib' },
      ['/morpheus/bin/morpheus', '-S', '-V', '-i'],
      'r+',
    ).and_yield(MorphMock.new('c'))
  end

  it 'finds the morphology of a Greek word' do
    get '/greek/a'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('<words>a</words>')
  end

  it 'finds the morphology of a Latin word' do
    get '/latin/b'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('<words>b</words>')
  end

  it 'passes command line options to Morpheus' do
    get '/greek/c?opts=ivs'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('<words>c</words>')
  end

  it 'shows not found if there is no route' do
    get '/'

    expect(last_response).to be_not_found
  end
end
