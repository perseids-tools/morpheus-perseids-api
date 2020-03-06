require 'digest'

require_relative './entry/dictionary_entry'
require_relative './entry/inflection'

class Parser
  class Word
    class Entry
      def initialize(doc)
        @content = doc.inner_html
        @dictionary_entries = doc.xpath('./dict').map { |d| DictionaryEntry.new(d) }
        @inflections = doc.xpath('./infl').map { |i| Inflection.new(i) }
      end

      def bamboo_xml
        @bamboo_xml ||= <<~XML
          <oac:hasBody rdf:resource="urn:uuid:idm#{digest}"/>
          <oac:Body rdf:about="urn:uuid:idm#{digest}">
            <rdf:type rdf:resource="cnt:ContentAsXML"/>
            <cnt:rest xmlns:cnt="http://www.w3.org/2008/content#">
              <entry uri="">
                #{components.map(&:bamboo_xml).join("\n")}
              </entry>
            </cnt:rest>
          </oac:Body>
        XML
      end

      private

      attr_reader :content, :dictionary_entries, :inflections

      def components
        dictionary_entries + inflections
      end

      def digest
        @digest ||= Digest::SHA256.hexdigest(content)
      end
    end
  end
end
