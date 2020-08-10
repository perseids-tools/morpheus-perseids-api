# Morpheus Perseids API

Morpheus Perseids API provides an API interface for the
[Morpheus Perseids](https://github.com/perseids-tools/morpheus-perseids)
version of the Morpheus morphological parsing tool.

It takes Ancient Greek or Latin text as input and then lemmatizes the text
and performs a morphological analysis.

## Running

### Docker Compose

#### Running a standalone server

```
docker-compose build
docker-compose up
```

#### Including in other compose files

Include `perseidsproject/morpheus-perseids-api` as one of your services in `docker-compose.yml`.
The simplest version would be:

```yaml
version: '3'
services:
  morph:
    image: perseidsproject/morpheus-perseids-api:v2.1.3
    ports:
      - "1500:1500"
```

The port can be customized using the environment variable `PORT` and the application
can be configured to use Redis caching by setting `REDIS_ENABLED` to `true`.
The Redis URL is configured using `REDIS_URL`.
For example, the configuration to run on port 3000 and with Redis is:

```yaml
version: '3'
services:
  morph:
    image: perseidsproject/morpheus-perseids-api:v2.1.3
    environment:
      - PORT=3000
      - REDIS_ENABLED=true
      - REDIS_URL=redis://redis:6379
    ports:
      - "3000:3000"
  redis:
    image: redis:5.0.8
    ports:
     - "6379:6379"
```


(See project on [Docker Hub](https://hub.docker.com/r/perseidsproject/morpheus-perseids-api/).)

#### Caching

The [docker-compose.yml](./docker-compose.yml) file in the root directory provides an example
of a setup using both Redis and Nginx caching.

### Unix/Linux

Requirements:

- Ruby (~2.5)
- Bundler

```bash
bundle install

MORPHLIB=/path/to/stemlib EXECUTABLE=/path/to/morpheus bundle exec ruby app.rb
```

## Usage

See [BAMBOO.md](./docs/BAMBOO.md) and [RAW.md](./docs/RAW.md).

### Examples

#### Greek

`http://localhost:1500/analysis/word?lang=grc&engine=morpheusgrc&word=ἄνθρωπος`

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

#### Latin

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
