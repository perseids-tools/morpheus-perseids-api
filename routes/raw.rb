require_relative '../lib/morpheus'

namespace '/raw' do
  get '/greek/:word' do
    content_type :xml

    Morpheus.raw(word, **query_options)
  end

  get '/latin/:word' do
    content_type :xml

    Morpheus.raw(word, latin: true, **query_options)
  end
end

private

def word
  (params[:word] || '').unicode_normalize
end

def query_options
  params.slice(:strict_case, :verbs_only, :verbose).transform_values do |param|
    if param == 'true'
      true
    elsif param == 'false'
      false
    else
      nil
    end
  end.compact.to_h.transform_keys(&:to_sym)
end
