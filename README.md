# Unicode::Blocks [![[version]](https://badge.fury.io/rb/unicode-blocks.svg)](https://badge.fury.io/rb/unicode-blocks)  [![[ci]](https://github.com/janlelis/unicode-blocks/workflows/Test/badge.svg)](https://github.com/janlelis/unicode-blocks/actions?query=workflow%3ATest)

Each Unicode character belongs to a [block](https://en.wikipedia.org/wiki/Unicode_block). This gem returns the all blocks associated with the given string.

Unicode version: **13.0.0** (March 2020)

Supported Rubies: **3.0**, **2.7**, **2.6**, **2.5**

Old Rubies which might still work: **2.4**, **2.3**, **2.2**, **2.1**, **2.0**

## Gemfile

```ruby
gem "unicode-blocks"
```

## Usage

```ruby
require "unicode/blocks"

# All blocks of a string
Unicode::Blocks.blocks("Abc") # => ["Basic Latin"]
Unicode::Blocks.blocks("СC") # => ["Cyrillic", "Basic Latin"]
Unicode::Blocks.blocks("⧉⪥⟤") # => ["Miscellaneous Mathematical Symbols-A",
                                    "Miscellaneous Mathematical Symbols-B",
                                    "Supplemental Mathematical Operators"]

# Also aliased as .of
Unicode::Blocks.of("🃉🂹") # => ["Playing Cards"]
Unicode::Blocks.of("\u{10c50}") # => ["No_Block"]

# Single character
Unicode::Blocks.block("☼") # => "Miscellaneous Symbols"
```

The list of blocks is always sorted alphabetically.

## Hints

### Regex Matching

If you have a string and want to match a substring/character from a specific Unicode block, you actually won't need this gem. Instead, you can use the [Regexp Unicode Property Syntax `\p{}`](https://ruby-doc.org/core/Regexp.html#class-Regexp-label-Character+Properties) with blocks by prefixing the block name with "In":

```ruby
"⧉⪥⟤".scan(/\p{In Miscellaneous Mathematical Symbols-B}/) # => ["⧉"]
```

See [Idiosyncratic Ruby: Proper Unicoding](https://idiosyncratic-ruby.com/41-proper-unicoding.html) for more info.

### Block Names

You can retrieve all block names (except for **No_Block**) like this:

```ruby
require "unicode/blocks"
puts Unicode::Blocks.names

# # # Output # # #

Basic Latin
Latin-1 Supplement
Latin Extended-A
Latin Extended-B
IPA Extensions
Spacing Modifier Letters
Combining Diacritical Marks
Greek and Coptic
Cyrillic
Cyrillic Supplement
Armenian
Hebrew
Arabic
Syriac
Arabic Supplement
Thaana
NKo
Samaritan
Mandaic
Syriac Supplement
Arabic Extended-A
Devanagari
Bengali
Gurmukhi
Gujarati
Oriya
Tamil
Telugu
Kannada
Malayalam
Sinhala
Thai
Lao
Tibetan
Myanmar
Georgian
Hangul Jamo
Ethiopic
Ethiopic Supplement
Cherokee
Unified Canadian Aboriginal Syllabics
Ogham
Runic
Tagalog
Hanunoo
Buhid
Tagbanwa
Khmer
Mongolian
Unified Canadian Aboriginal Syllabics Extended
Limbu
Tai Le
New Tai Lue
Khmer Symbols
Buginese
Tai Tham
Combining Diacritical Marks Extended
Balinese
Sundanese
Batak
Lepcha
Ol Chiki
Cyrillic Extended-C
Georgian Extended
Sundanese Supplement
Vedic Extensions
Phonetic Extensions
Phonetic Extensions Supplement
Combining Diacritical Marks Supplement
Latin Extended Additional
Greek Extended
General Punctuation
Superscripts and Subscripts
Currency Symbols
Combining Diacritical Marks for Symbols
Letterlike Symbols
Number Forms
Arrows
Mathematical Operators
Miscellaneous Technical
Control Pictures
Optical Character Recognition
Enclosed Alphanumerics
Box Drawing
Block Elements
Geometric Shapes
Miscellaneous Symbols
Dingbats
Miscellaneous Mathematical Symbols-A
Supplemental Arrows-A
Braille Patterns
Supplemental Arrows-B
Miscellaneous Mathematical Symbols-B
Supplemental Mathematical Operators
Miscellaneous Symbols and Arrows
Glagolitic
Latin Extended-C
Coptic
Georgian Supplement
Tifinagh
Ethiopic Extended
Cyrillic Extended-A
Supplemental Punctuation
CJK Radicals Supplement
Kangxi Radicals
Ideographic Description Characters
CJK Symbols and Punctuation
Hiragana
Katakana
Bopomofo
Hangul Compatibility Jamo
Kanbun
Bopomofo Extended
CJK Strokes
Katakana Phonetic Extensions
Enclosed CJK Letters and Months
CJK Compatibility
CJK Unified Ideographs Extension A
Yijing Hexagram Symbols
CJK Unified Ideographs
Yi Syllables
Yi Radicals
Lisu
Vai
Cyrillic Extended-B
Bamum
Modifier Tone Letters
Latin Extended-D
Syloti Nagri
Common Indic Number Forms
Phags-pa
Saurashtra
Devanagari Extended
Kayah Li
Rejang
Hangul Jamo Extended-A
Javanese
Myanmar Extended-B
Cham
Myanmar Extended-A
Tai Viet
Meetei Mayek Extensions
Ethiopic Extended-A
Latin Extended-E
Cherokee Supplement
Meetei Mayek
Hangul Syllables
Hangul Jamo Extended-B
High Surrogates
High Private Use Surrogates
Low Surrogates
Private Use Area
CJK Compatibility Ideographs
Alphabetic Presentation Forms
Arabic Presentation Forms-A
Variation Selectors
Vertical Forms
Combining Half Marks
CJK Compatibility Forms
Small Form Variants
Arabic Presentation Forms-B
Halfwidth and Fullwidth Forms
Specials
Linear B Syllabary
Linear B Ideograms
Aegean Numbers
Ancient Greek Numbers
Ancient Symbols
Phaistos Disc
Lycian
Carian
Coptic Epact Numbers
Old Italic
Gothic
Old Permic
Ugaritic
Old Persian
Deseret
Shavian
Osmanya
Osage
Elbasan
Caucasian Albanian
Linear A
Cypriot Syllabary
Imperial Aramaic
Palmyrene
Nabataean
Hatran
Phoenician
Lydian
Meroitic Hieroglyphs
Meroitic Cursive
Kharoshthi
Old South Arabian
Old North Arabian
Manichaean
Avestan
Inscriptional Parthian
Inscriptional Pahlavi
Psalter Pahlavi
Old Turkic
Old Hungarian
Hanifi Rohingya
Rumi Numeral Symbols
Yezidi
Old Sogdian
Sogdian
Chorasmian
Elymaic
Brahmi
Kaithi
Sora Sompeng
Chakma
Mahajani
Sharada
Sinhala Archaic Numbers
Khojki
Multani
Khudawadi
Grantha
Newa
Tirhuta
Siddham
Modi
Mongolian Supplement
Takri
Ahom
Dogra
Warang Citi
Dives Akuru
Nandinagari
Zanabazar Square
Soyombo
Pau Cin Hau
Bhaiksuki
Marchen
Masaram Gondi
Gunjala Gondi
Makasar
Lisu Supplement
Tamil Supplement
Cuneiform
Cuneiform Numbers and Punctuation
Early Dynastic Cuneiform
Egyptian Hieroglyphs
Egyptian Hieroglyph Format Controls
Anatolian Hieroglyphs
Bamum Supplement
Mro
Bassa Vah
Pahawh Hmong
Medefaidrin
Miao
Ideographic Symbols and Punctuation
Tangut
Tangut Components
Khitan Small Script
Tangut Supplement
Kana Supplement
Kana Extended-A
Small Kana Extension
Nushu
Duployan
Shorthand Format Controls
Byzantine Musical Symbols
Musical Symbols
Ancient Greek Musical Notation
Mayan Numerals
Tai Xuan Jing Symbols
Counting Rod Numerals
Mathematical Alphanumeric Symbols
Sutton SignWriting
Glagolitic Supplement
Nyiakeng Puachue Hmong
Wancho
Mende Kikakui
Adlam
Indic Siyaq Numbers
Ottoman Siyaq Numbers
Arabic Mathematical Alphabetic Symbols
Mahjong Tiles
Domino Tiles
Playing Cards
Enclosed Alphanumeric Supplement
Enclosed Ideographic Supplement
Miscellaneous Symbols and Pictographs
Emoticons
Ornamental Dingbats
Transport and Map Symbols
Alchemical Symbols
Geometric Shapes Extended
Supplemental Arrows-C
Supplemental Symbols and Pictographs
Chess Symbols
Symbols and Pictographs Extended-A
Symbols for Legacy Computing
CJK Unified Ideographs Extension B
CJK Unified Ideographs Extension C
CJK Unified Ideographs Extension D
CJK Unified Ideographs Extension E
CJK Unified Ideographs Extension F
CJK Compatibility Ideographs Supplement
CJK Unified Ideographs Extension G
Tags
Variation Selectors Supplement
Supplementary Private Use Area-A
Supplementary Private Use Area-B
```

See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries.

## MIT License

- Copyright (C) 2016-2021 Jan Lelis <https://janlelis.com>. Released under the MIT license.
- Unicode data: https://www.unicode.org/copyright.html#Exhibit1
