# Yt::Audit

Welcome! This is a Ruby library you can audit a YouTube video.

The **source code** is available on [GitHub](https://github.com/Fullscreen/yt-audit) and the **documentation** on [RubyDoc](http://www.rubydoc.info/github/fullscreen/yt-audit/master/Yt/Audit).

[![Build Status](http://img.shields.io/travis/Fullscreen/yt-audit/master.svg)](https://travis-ci.org/Fullscreen/yt-audit)
[![Coverage Status](http://img.shields.io/coveralls/Fullscreen/yt-audit/master.svg)](https://coveralls.io/r/Fullscreen/yt-audit)
[![Dependency Status](http://img.shields.io/gemnasium/Fullscreen/yt-audit.svg)](https://gemnasium.com/Fullscreen/yt-audit)
[![Code Climate](http://img.shields.io/codeclimate/github/Fullscreen/yt-audit.svg)](https://codeclimate.com/github/Fullscreen/yt-audit)
[![Online docs](http://img.shields.io/badge/docs-✓-green.svg)](http://www.rubydoc.info/github/fullscreen/yt-audit/master/Yt/Audit)
[![Gem Version](http://img.shields.io/gem/v/yt-audit.svg)](http://rubygems.org/gems/yt-audit)


## Development

    $ bin/setup

    $ YT_API_KEY="123456789012345678901234567890" rake
    $ open coverage/index.html

    $ yardoc
    $ open doc/index.html

## Usage

```ruby
Yt::Audit.has_info_cards?('rF711XAtrVg')
# => true
Yt::Audit.has_brand_anchoring?('rF711XAtrVg', 'Budweiser')
# => true
Yt::Audit.has_subscribe_annotations?('rF711XAtrVg')
# => false
Yt::Audit.has_link_to_own_channel?('rF711XAtrVg')
# => false
Yt::Audit.has_end_cards?('rF711XAtrVg')
# => false
```
