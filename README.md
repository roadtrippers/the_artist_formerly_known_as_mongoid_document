# TheArtistFormerlyKnownAsMongoidDocument

Moving away from Mongo/Mongoid in a Rails app?  Still wish to honor legacy
mongo `ObjectId`s?  Well do I have the solution for you!
`TheArtistFormerlyKnownAsMongoidDocument` is a simple approach that allows
`#find` methods to still look up by a mongo id.

## Installation

Add this line to your application's Gemfile:

    gem 'the_artist_formerly_known_as_mongoid_document'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-the_artist_formerly_known_as_mongoid_document

## Usage

As you migrate from a `Mongoid::Document` model to a new `ActiveRecord` model,
make sure to include an indexed field `mongo_id` which contains the old mongo
id. In your new model, extend `TheArtistFormerlyKnownAsMongoidDocument`.
For example:

```ruby
require 'the_artist_formerly_known_as_mongoid_document'

class Artist < ActiveRecord::Base
  extend 'TheArtistFormerlyKnownAsMongoidDocument'

  # ...

end
```

You can then use `#find` for both `mongo_id`s:

```ruby
Artist.find('52829a3e73d8b08b00ad5d63')
```

And of course you can still look for plain-old regular `id`s:

```ruby
Artist.find(1)
```

### Note

If you are using something like [FriendlyId], it is wise to put `extend
TheArtistFormerlyKnownAsMongoidDocument` after `extend FriendlyId`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[FriendlyId]: https://github.com/norman/friendly_id
