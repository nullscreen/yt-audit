# Yt::Audit

Welcome! This is a Ruby library you can audit a YouTube video.

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
```
