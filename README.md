# TweetSanitizer

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tweet_sanitizer`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tweet_sanitizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tweet_sanitizer

## Usage

TODO: Write usage instructions here

## Development

```bash
cp .env.example .env
vi .env
./bin/console
```

```ruby
[1] pry(main)> @client.status("https://twitter.com/sue445/status/896748477262082049")
=> #<Twitter::Tweet id=896748477262082049>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tweet_sanitizer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
