# Yt::Audit

Welcome! This is a Ruby library you can audit titles, tags and annotations of a YouTube channel or playlist.

## Development

    $ ruby test/yt/audit_test.rb

## Usage

```ruby
Yt::Audit.has_info_cards?('rF711XAtrVg')
# => true
Yt::Audit.has_brand_anchoring?('rF711XAtrVg', 'Budweiser')
# => true
```
