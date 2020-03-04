require 'beta_code'

class Converter
  # The Beta Code used by Morpheus to represent Greek characters differs slightly from
  # the specification (https://web.archive.org/web/20140221210442/http://www.tlg.uci.edu/encoding/BCM2013.pdf)
  # in the following ways:
  MORPHEUS_CUSTOM_BETA_TO_GREEK = {
    # The Beta Code specification says that _ should map to the EM dash
    # However Morpheus uses _ to represent a macron in <stem> and <suff> tags
    # The following mapping covers every case that should appear with a macron
    a_: 'ᾱ',
    'a)_': 'ἀ̄',
    'a(_': 'ἁ̄',
    '*)a_': 'Ἀ̄',
    '*(a_': 'Ἁ̄',
    i_: 'ῑ',
    'i)_': 'ἰ̄',
    'i(_': 'ἱ̄',
    '*)i_': 'Ἰ̄',
    '*(i_': 'Ἱ̄',
    u_: 'ῡ',
    'u)_': 'ὐ̄',
    'u(_': 'ὑ̄',
    '*(u_': 'Ὑ̄', # there is no *)u_ in Unicode

    # The Beta Code specification uses a number after s to specify different versions of sigma
    # s is σ or ς, s1 is σ, s2 is ς, s3 is ϲ (lunate sigma), *S is Σ, and *S3 is Ϲ
    # Morpheus sometimes uses a number at the end of a word to differentiate identical headwords
    # eg ὅς (rel. pron.) and ὅς2 (poss. pron.)
    s1: 'ς1',
    s2: 'ς2',
    s3: 'ς3',
    '*s3': 'Σ3',

    # The Beta Code specification says that : should be converted to ·
    # Morpheus uses : to separate preverbs and augments from the rest of the stem
    ':': ':',
  }

  # For the reverse mapping simply remove the macron
  MORPHEUS_CUSTOM_GREEK_TO_BETA = {
    _: '',
  }

  def self.beta_code_to_greek(word)
    BetaCode.beta_code_to_greek(word, custom_map: MORPHEUS_CUSTOM_BETA_TO_GREEK)
  end

  def self.greek_to_beta_code(word)
    BetaCode.greek_to_beta_code(word, custom_map: MORPHEUS_CUSTOM_GREEK_TO_BETA)
  end

  # To differentiate between identical headwords in Latin, Morpheus appends #1, #2, etc.
  # For Greek it appends the digit (without the # character)
  # In order to match the Greek output we want to remove the # but keep the number
  def self.latin_headword(word)
    word.sub(/#(?=\d+\z)/, '')
  end
end
