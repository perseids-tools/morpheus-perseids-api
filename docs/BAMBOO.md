# Bamboo endpoints

These API endpoints are based on the Project Bamboo
[Morphological Analysis Service Contract Description](https://wikihub.berkeley.edu/display/pbamboo/Morphological+Analysis+Service+Contract+Description+-+v1.1.1).

# Examples

`http://localhost:1500/analysis/word?lang=grc&engine=morpheusgrc&word=ἄνθρωπος`

## Greek

```json
{
  "RDF":{
    "Annotation":{
      "about":"urn:TuftsMorphologyService:ἄνθρωπος:morpheusgrc",
      "creator":{
        "Agent":{
          "about":"org.perseus:tools:morpheus.v1"
        }
      },
      "created":{
        "$":"2020-01-01T00:00:00.000000"
      },
      "hasTarget":{
        "Description":{
          "about":"urn:word:ἄνθρωπος"
        }
      },
      "title":{

      },
      "hasBody":{
        "resource":"urn:uuid:idme9bc7066c297cbb5b76e7750cb374940290ce9480c26840a0c1acfd400016786"
      },
      "Body":{
        "about":"urn:uuid:idme9bc7066c297cbb5b76e7750cb374940290ce9480c26840a0c1acfd400016786",
        "type":{
          "resource":"cnt:ContentAsXML"
        },
        "rest":{
          "entry":{
            "uri":null,
            "dict":{
              "hdwd":{
                "lang":"grc",
                "$":"ἄνθρωπος"
              },
              "pofs":{
                "order":3,
                "$":"noun"
              },
              "decl":{
                "$":"2nd"
              },
              "gend":{
                "$":"masculine"
              }
            },
            "infl":{
              "term":{
                "lang":"grc",
                "stem":{
                  "$":"ἀνθρωπ"
                },
                "suff":{
                  "$":"ος"
                }
              },
              "pofs":{
                "order":3,
                "$":"noun"
              },
              "decl":{
                "$":"2nd"
              },
              "case":{
                "order":7,
                "$":"nominative"
              },
              "gend":{
                "$":"masculine"
              },
              "num":{
                "$":"singular"
              },
              "stemtype":{
                "$":"os_ou"
              }
            }
          }
        }
      }
    }
  }
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <oac:Annotation xmlns:oac="http://www.openannotation.org/ns/" rdf:about="urn:TuftsMorphologyService:ἄνθρωπος:morpheusgrc">
    <dcterms:creator xmlns:dcterms="http://purl.org/dc/terms/">
      <foaf:Agent xmlns:foaf="http://xmlns.com/foaf/0.1/" rdf:about="org.perseus:tools:morpheus.v1" />
    </dcterms:creator>
    <dcterms:created xmlns:dcterms="http://purl.org/dc/terms/">2020-01-01T00:00:00.000000</dcterms:created>
    <oac:hasTarget>
      <rdf:Description rdf:about="urn:word:ἄνθρωπος" />
    </oac:hasTarget>
    <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/" />
    <oac:hasBody rdf:resource="urn:uuid:idme9bc7066c297cbb5b76e7750cb374940290ce9480c26840a0c1acfd400016786" />
    <oac:Body rdf:about="urn:uuid:idme9bc7066c297cbb5b76e7750cb374940290ce9480c26840a0c1acfd400016786">
      <rdf:type rdf:resource="cnt:ContentAsXML" />
      <cnt:rest xmlns:cnt="http://www.w3.org/2008/content#">
        <entry uri="">
          <dict>
            <hdwd xml:lang="grc">ἄνθρωπος</hdwd>
            <pofs order="3">noun</pofs>
            <decl>2nd</decl>
            <gend>masculine</gend>
          </dict>
          <infl>
            <term xml:lang="grc">
              <stem>ἀνθρωπ</stem>
              <suff>ος</suff>
            </term>
            <pofs order="3">noun</pofs>
            <decl>2nd</decl>
            <case order="7">nominative</case>
            <gend>masculine</gend>
            <num>singular</num>
            <stemtype>os_ou</stemtype>
          </infl>
        </entry>
      </cnt:rest>
    </oac:Body>
  </oac:Annotation>
</rdf:RDF>
```

## Latin

`http://localhost:1500/analysis/word?lang=lat&engine=morpheuslat&word=homo`

```json
{
  "RDF":{
    "Annotation":{
      "about":"urn:TuftsMorphologyService:homo:morpheuslat",
      "creator":{
        "Agent":{
          "about":"org.perseus:tools:morpheus.v1"
        }
      },
      "created":{
        "$":"2020-01-01T00:00:00.000000"
      },
      "hasTarget":{
        "Description":{
          "about":"urn:word:homo"
        }
      },
      "title":{

      },
      "hasBody":{
        "resource":"urn:uuid:idm1f6495b96a1082a031f512e601dd2f8277cb96aa6b3da261d9a7a4df18316e72"
      },
      "Body":{
        "about":"urn:uuid:idm1f6495b96a1082a031f512e601dd2f8277cb96aa6b3da261d9a7a4df18316e72",
        "type":{
          "resource":"cnt:ContentAsXML"
        },
        "rest":{
          "entry":{
            "uri":null,
            "dict":{
              "hdwd":{
                "lang":"lat",
                "$":"homo"
              },
              "pofs":{
                "order":3,
                "$":"noun"
              },
              "decl":{
                "$":"3rd"
              },
              "gend":{
                "$":"masculine/feminine"
              }
            },
            "infl":[
              {
                "term":{
                  "lang":"lat",
                  "stem":{
                    "$":"hom"
                  },
                  "suff":{
                    "$":"o_"
                  }
                },
                "pofs":{
                  "order":3,
                  "$":"noun"
                },
                "decl":{
                  "$":"3rd"
                },
                "case":{
                  "order":7,
                  "$":"nominative"
                },
                "gend":{
                  "$":"masculine"
                },
                "num":{
                  "$":"singular"
                },
                "stemtype":{
                  "$":"o_inis"
                }
              },
              {
                "term":{
                  "lang":"lat",
                  "stem":{
                    "$":"hom"
                  },
                  "suff":{
                    "$":"o_"
                  }
                },
                "pofs":{
                  "order":3,
                  "$":"noun"
                },
                "decl":{
                  "$":"3rd"
                },
                "case":{
                  "order":7,
                  "$":"nominative"
                },
                "gend":{
                  "$":"feminine"
                },
                "num":{
                  "$":"singular"
                },
                "stemtype":{
                  "$":"o_inis"
                }
              }
            ]
          }
        }
      }
    }
  }
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <oac:Annotation xmlns:oac="http://www.openannotation.org/ns/" rdf:about="urn:TuftsMorphologyService:homo:morpheuslat">
    <dcterms:creator xmlns:dcterms="http://purl.org/dc/terms/">
      <foaf:Agent xmlns:foaf="http://xmlns.com/foaf/0.1/" rdf:about="org.perseus:tools:morpheus.v1" />
    </dcterms:creator>
    <dcterms:created xmlns:dcterms="http://purl.org/dc/terms/">2020-01-01T00:00:00.000000</dcterms:created>
    <oac:hasTarget>
      <rdf:Description rdf:about="urn:word:homo" />
    </oac:hasTarget>
    <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/" />
    <oac:hasBody rdf:resource="urn:uuid:idm1f6495b96a1082a031f512e601dd2f8277cb96aa6b3da261d9a7a4df18316e72" />
    <oac:Body rdf:about="urn:uuid:idm1f6495b96a1082a031f512e601dd2f8277cb96aa6b3da261d9a7a4df18316e72">
      <rdf:type rdf:resource="cnt:ContentAsXML" />
      <cnt:rest xmlns:cnt="http://www.w3.org/2008/content#">
        <entry uri="">
          <dict>
            <hdwd xml:lang="lat">homo</hdwd>
            <pofs order="3">noun</pofs>
            <decl>3rd</decl>
            <gend>masculine/feminine</gend>
          </dict>
          <infl>
            <term xml:lang="lat">
              <stem>hom</stem>
              <suff>o_</suff>
            </term>
            <pofs order="3">noun</pofs>
            <decl>3rd</decl>
            <case order="7">nominative</case>
            <gend>masculine</gend>
            <num>singular</num>
            <stemtype>o_inis</stemtype>
          </infl>
          <infl>
            <term xml:lang="lat">
              <stem>hom</stem>
              <suff>o_</suff>
            </term>
            <pofs order="3">noun</pofs>
            <decl>3rd</decl>
            <case order="7">nominative</case>
            <gend>feminine</gend>
            <num>singular</num>
            <stemtype>o_inis</stemtype>
          </infl>
        </entry>
      </cnt:rest>
    </oac:Body>
  </oac:Annotation>
</rdf:RDF>
```

## Details

The `/analysis/word` route returns the morphology of a Greek or Latin word.
It requires the following parameters:

| Paramter | Allowed values               |
| -------- | ---------------------------- |
| lang     | `grc`, `lat`, `la`           |
| engine   | `morpheusgrc`, `morpheuslat` |
| word     | Any Greek or Latin word      |

The route accepts a `GET` request with query string parameters
or a `POST` request with parameters in the request body (content type `application/x-www-form-urlencoded`).

### Format

By default these endpoints return JSON.
If a request is made with an `Accept` header that includes `application/xml`, then XML will be returned instead.

### Other routes and parameters

There is also an `/engine` route and a `strictCase` parameter.
These were implemented to be fully backwards-compatible with the
[Morphsvc](https://github.com/perseids-project/morphsvc) repository.
They are intentionally not documented and should not be relied on;
they may be removed in future versions.
