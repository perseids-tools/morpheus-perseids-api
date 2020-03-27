require 'cgi'
require 'beta_code'

require_relative './word'
require_relative './unknown'

class Parser
  CREATED_DATE = '2020-01-01T00:00:00.000000'

  class Response
    def initialize(word, doc, latin: false)
      @word = CGI.escapeHTML(word)
      @latin = latin

      @words = doc.xpath('./words/word').map { |w| Word.new(w) }
      @unknowns = doc.xpath('./words/unknown').map { |u| Unknown.new(u) }
    end

    def bamboo_xml
      @bamboo_xml ||= <<~XML
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
          <oac:Annotation xmlns:oac="http://www.openannotation.org/ns/" rdf:about="#{morphology_service}">
            <dcterms:creator xmlns:dcterms="http://purl.org/dc/terms/">
              <foaf:Agent xmlns:foaf="http://xmlns.com/foaf/0.1/" rdf:about="org.perseus:tools:morpheus.v1"/>
            </dcterms:creator>
            <dcterms:created xmlns:dcterms="http://purl.org/dc/terms/">#{CREATED_DATE}</dcterms:created>
            <oac:hasTarget>
              <rdf:Description rdf:about="urn:word:#{word}"/>
            </oac:hasTarget>
            <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/"/>
            #{components.map(&:bamboo_xml).join("\n")}
          </oac:Annotation>
        </rdf:RDF>
      XML
    end

    def bamboo_json
      @bamboo_json ||= {
        RDF: {
          Annotation: {
            about: morphology_service,
            creator: {
              Agent: {
                about: 'org.perseus:tools:morpheus.v1',
              },
            },
            created: {
              '$': CREATED_DATE,
            },
            hasTarget: {
              Description: {
                about: "urn:word:#{word}",
              },
            },
            title: {
            },
          }.merge!(components_json),
        },
      }
    end

    private

    attr_reader :word, :latin, :words, :unknowns

    def components
      words + unknowns
    end

    def morphology_service
      "urn:TuftsMorphologyService:#{word}:morpheus#{latin ? 'lat' : 'grc'}"
    end

    def components_json
      entries = words.flat_map(&:entries)

      case entries.size
      when 0 then {}
      when 1 then { hasBody: entries.first.bamboo_has_body_json, Body: entries.first.bamboo_body_json }
      else { hasBody: entries.map(&:bamboo_has_body_json), Body: entries.map(&:bamboo_body_json) }
      end
    end
  end
end
