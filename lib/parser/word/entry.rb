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
          <oac:hasBody rdf:resource="#{uuid}"/>
          <oac:Body rdf:about="#{uuid}">
            <rdf:type rdf:resource="cnt:ContentAsXML"/>
            <cnt:rest xmlns:cnt="http://www.w3.org/2008/content#">
              <entry uri="">
                #{components.map(&:bamboo_xml).join("\n")}
              </entry>
            </cnt:rest>
          </oac:Body>
        XML
      end

      def bamboo_has_body_json
        @bamboo_has_body_json ||= { resource: uuid }
      end

      def bamboo_body_json
        @bamboo_body_json ||= {
          about: uuid,
          type: { resource: 'cnt:ContentAsXML' },
          rest: {
            entry: {
              uri: nil,
            }.merge!(dictionary_entry_json).merge!(inflection_json),
          },
        }
      end

      private

      attr_reader :content, :dictionary_entries, :inflections

      def components
        dictionary_entries + inflections
      end

      def digest
        @digest ||= Digest::SHA256.hexdigest(content)
      end

      def uuid
        @uuid ||= "urn:uuid:idm#{digest}"
      end

      def inflection_json
        case inflections.size
        when 0 then {}
        when 1 then { infl: inflections.first.bamboo_json }
        else { infl: inflections.map(&:bamboo_json) }
        end
      end

      def dictionary_entry_json
        case dictionary_entries.size
        when 0 then {}
        when 1 then { dict: dictionary_entries.first.bamboo_json }
        else { dict: dictionary_entries.map(&:bamboo_json) }
        end
      end
    end
  end
end
