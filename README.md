# zipcode-at

Find austrian city data by zip code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zipcode-at'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zipcode-at

## Usage

```ruby
require 'zipcode-at'

# use it directly
z = ZipCode::AT.new
z.load                         # builds memory-backed global index

z.search(:zip, '1000')         # exact zip code search

# use it through ZipCode::DB
ZipCode::DB.for(:at).load
ZipCode::DB.for(:at).search(:zip, '1000')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timoschilling/zipcode-at.

## Credits

Data source: https://www.post.at/geschaeftlich_werben_produkte_und_services_adressen_postlexikon.php