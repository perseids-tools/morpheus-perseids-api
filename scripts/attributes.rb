module Attributes
  ATTRIBUTE_MAP = {
    pofs: :pos,
    comp: :degree,
  }

  VALUE_MAP = {
    pos: {
      "verb\nparticiple" => 'verb',
      'verb participle' => 'verb',
    },
    tense: {
      'pluperfect' => 'plusquamperfect',
    },
    voice: {
      'mediopassive' => 'medio-passive',
    },
  }

  POSTAG_SCHEMA = [
    :pos,
    :pers,
    :num,
    :tense,
    :mood,
    :voice,
    :gend,
    :case,
    :degree,
  ]

  module Greek
    ATTRIBUTE_MAP = {
      pos: {
        long: 'Part of Speech',
        short: 'pos',
        values: {
          noun: {
            long: 'noun',
            short: 'noun',
            postag: 'n',
          },
          adj: {
            long: 'adjective',
            short: 'adj',
            postag: 'a',
          },
          adv: {
            long: 'adverb',
            short: 'adv',
            postag: 'd',
          },
          conj: {
            long: 'conjunction',
            short: 'conj',
            postag: 'c',
          },
          prep: {
            long: 'preposition',
            short: 'prep',
            postag: 'r',
          },
          pron: {
            long: 'pronoun',
            short: 'pron',
            postag: 'p',
          },
          excl: {
            long: 'exclamation',
            short: 'excl',
            postag: 'e',
          },
          verb: {
            long: 'verb',
            short: 'verb',
            postag: 'v',
          },
          nrl: {
            long: 'numeral',
            short: 'nrl',
            postag: 'm',
          },
          punct: {
            long: 'punctuation',
            short: 'punct',
            postag: 'u',
          },
          art: {
            long: 'article',
            short: 'art',
            postag: 'l',
          },
          prtl: {
            long: 'particle',
            short: 'prtl',
            postag: 'g',
          },
          irreg: {
            long: 'irregular',
            short: 'irreg',
            postag: 'x',
          },
        },
      },
      pers: {
        long: 'Person',
        short: 'pers',
        values: {
          '1st': {
            long: 'first person',
            short: '1st',
            postag: '1',
          },
          '2nd': {
            long: 'second person',
            short: '2nd',
            postag: '2',
          },
          '3rd': {
            long: 'third person',
            short: '3rd',
            postag: '3',
          },
        },
      },
      num: {
        long: 'Number',
        short: 'num',
        values: {
          sg: {
            long: 'singular',
            short: 'sg',
            postag: 's',
          },
          pl: {
            long: 'plural',
            short: 'pl',
            postag: 'p',
          },
          dl: {
            long: 'dual',
            short: 'dl',
            postag: 'd',
          },
        },
      },
      tense: {
        long: 'Tense',
        short: 'tense',
        values: {
          pr: {
            long: 'present',
            short: 'pr',
            postag: 'p',
          },
          imp: {
            long: 'imperfect',
            short: 'imp',
            postag: 'i',
          },
          perf: {
            long: 'perfect',
            short: 'perf',
            postag: 'r',
          },
          pqpf: {
            long: 'plusquamperfect',
            short: 'pqpf',
            postag: 'l',
          },
          fex: {
            long: 'future perfect',
            short: 'fex',
            postag: 't',
          },
          fut: {
            long: 'future',
            short: 'fut',
            postag: 'f',
          },
          aor: {
            long: 'aorist',
            short: 'aor',
            postag: 'a',
          },
        },
      },
      mood: {
        long: 'Mood',
        short: 'mood',
        values: {
          ind: {
            long: 'indicative',
            short: 'ind',
            postag: 'i',
          },
          sub: {
            long: 'subjunctive',
            short: 'sub',
            postag: 's',
          },
          inf: {
            long: 'infinitive',
            short: 'inf',
            postag: 'n',
          },
          imp: {
            long: 'imperative',
            short: 'imp',
            postag: 'm',
          },
          part: {
            long: 'participle',
            short: 'part',
            postag: 'p',
          },
          opt: {
            long: 'optative',
            short: 'opt',
            postag: 'o',
          },
        },
      },
      voice: {
        long: 'Voice',
        short: 'voice',
        values: {
          act: {
            long: 'active',
            short: 'act',
            postag: 'a',
          },
          pass: {
            long: 'passive',
            short: 'pass',
            postag: 'p',
          },
          mid: {
            long: 'middle',
            short: 'mid',
            postag: 'm',
          },
          mp: {
            long: 'medio-passive',
            short: 'mp',
            postag: 'e',
          },
          dep: {
            long: 'deponens',
            short: 'dep',
            postag: 'd',
          },
        },
      },
      gend: {
        long: 'gender',
        short: 'gend',
        values: {
          masc: {
            long: 'masculine',
            short: 'masc',
            postag: 'm',
          },
          fem: {
            long: 'feminine',
            short: 'fem',
            postag: 'f',
          },
          neut: {
            long: 'neuter',
            short: 'neut',
            postag: 'n',
          },
        },
      },
      case: {
        long: 'Casus',
        short: 'case',
        values: {
          nom: {
            long: 'nominative',
            short: 'nom',
            postag: 'n',
          },
          gen: {
            long: 'genitive',
            short: 'gen',
            postag: 'g',
          },
          dat: {
            long: 'dative',
            short: 'dat',
            postag: 'd',
          },
          acc: {
            long: 'accusative',
            short: 'acc',
            postag: 'a',
          },
          voc: {
            long: 'vocative',
            short: 'voc',
            postag: 'v',
          },
          loc: {
            long: 'locative',
            short: 'loc',
            postag: 'l',
          },
        },
      },
      degree: {
        long: 'Degree',
        short: 'degree',
        values: {
          pos: {
            long: 'positive',
            short: 'pos',
            postag: 'p',
          },
          comp: {
            long: 'comparative',
            short: 'comp',
            postag: 'c',
          },
          sup: {
            long: 'superlative',
            short: 'sup',
            postag: 's',
          },
        },
      },
    }
  end

  module Latin
    ATTRIBUTE_MAP = {
      pos: {
        long: 'Part of Speech',
        short: 'pos',
        values: {
          noun: {
            long: 'noun',
            short: 'noun',
            postag: 'n',
          },
          adj: {
            long: 'adjective',
            short: 'adj',
            postag: 'a',
          },
          adv: {
            long: 'adverb',
            short: 'adv',
            postag: 'd',
          },
          conj: {
            long: 'conjunction',
            short: 'conj',
            postag: 'c',
          },
          prep: {
            long: 'preposition',
            short: 'prep',
            postag: 'r',
          },
          pron: {
            long: 'pronoun',
            short: 'pron',
            postag: 'p',
          },
          excl: {
            long: 'exclamation',
            short: 'excl',
            postag: 'e',
          },
          verb: {
            long: 'verb',
            short: 'verb',
            postag: 'v',
          },
          nrl: {
            long: 'numeral',
            short: 'nrl',
            postag: 'm',
          },
          punct: {
            long: 'punctuation',
            short: 'punct',
            postag: 'u',
          },
          irreg: {
            long: 'irregular',
            short: 'irreg',
            postag: 'x',
          },
        },
      },
      pers: {
        long: 'Person',
        short: 'pers',
        values: {
          '1st': {
            long: 'first person',
            short: '1st',
            postag: '1',
          },
          '2nd': {
            long: 'second person',
            short: '2nd',
            postag: '2',
          },
          '3rd': {
            long: 'third person',
            short: '3rd',
            postag: '3',
          },
        },
      },
      num: {
        long: 'Number',
        short: 'num',
        values: {
          sg: {
            long: 'singular',
            short: 'sg',
            postag: 's',
          },
          pl: {
            long: 'plural',
            short: 'pl',
            postag: 'p',
          },
        },
      },
      tense: {
        long: 'Tense',
        short: 'tense',
        values: {
          pr: {
            long: 'present',
            short: 'pr',
            postag: 'p',
          },
          imp: {
            long: 'imperfect',
            short: 'imp',
            postag: 'i',
          },
          perf: {
            long: 'perfect',
            short: 'perf',
            postag: 'r',
          },
          pqpf: {
            long: 'plusquamperfect',
            short: 'pqpf',
            postag: 'l',
          },
          fex: {
            long: 'future perfect',
            short: 'fex',
            postag: 't',
          },
          fut: {
            long: 'future',
            short: 'fut',
            postag: 'f',
          },
        },
      },
      mood: {
        long: 'Mood',
        short: 'mood',
        values: {
          ind: {
            long: 'indicative',
            short: 'ind',
            postag: 'i',
          },
          sub: {
            long: 'subjunctive',
            short: 'sub',
            postag: 's',
          },
          inf: {
            long: 'infinitive',
            short: 'inf',
            postag: 'n',
          },
          imp: {
            long: 'imperative',
            short: 'imp',
            postag: 'm',
          },
          gerund: {
            long: 'gerund',
            short: 'gerund',
            postag: 'd',
          },
          gerundive: {
            long: 'gerundive',
            short: 'gerundive',
            postag: 'g',
          },
          part: {
            long: 'participle',
            short: 'part',
            postag: 'p',
          },
          sup: {
            long: 'supine',
            short: 'sup',
            postag: 's',
          },
        },
      },
      voice: {
        long: 'Voice',
        short: 'voice',
        values: {
          act: {
            long: 'active',
            short: 'act',
            postag: 'a',
          },
          pass: {
            long: 'passive',
            short: 'pass',
            postag: 'p',
          },
          dep: {
            long: 'deponens',
            short: 'dep',
            postag: 'd',
          },
        },
      },
      gend: {
        long: 'gender',
        short: 'gend',
        values: {
          masc: {
            long: 'masculine',
            short: 'masc',
            postag: 'm',
          },
          fem: {
            long: 'feminine',
            short: 'fem',
            postag: 'f',
          },
          neut: {
            long: 'neuter',
            short: 'neut',
            postag: 'n',
          },
        },
      },
      case: {
        long: 'Casus',
        short: 'case',
        values: {
          nom: {
            long: 'nominative',
            short: 'nom',
            postag: 'n',
          },
          gen: {
            long: 'genitive',
            short: 'gen',
            postag: 'g',
          },
          dat: {
            long: 'dative',
            short: 'dat',
            postag: 'd',
          },
          acc: {
            long: 'accusative',
            short: 'acc',
            postag: 'a',
          },
          voc: {
            long: 'vocative',
            short: 'voc',
            postag: 'v',
          },
          abl: {
            long: 'ablative',
            short: 'abl',
            postag: 'b',
          },
          loc: {
            long: 'locative',
            short: 'loc',
            postag: 'l',
          },
        },
      },
      degree: {
        long: 'Degree',
        short: 'degree',
        values: {
          pos: {
            long: 'positive',
            short: 'pos',
            postag: 'p',
          },
          comp: {
            long: 'comparative',
            short: 'comp',
            postag: 'c',
          },
          sup: {
            long: 'superlative',
            short: 'sup',
            postag: 's',
          },
        },
      },
    }
  end
end
