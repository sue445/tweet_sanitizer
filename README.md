# TweetSanitizer
[![Gem Version](https://badge.fury.io/rb/tweet_sanitizer.svg)](https://badge.fury.io/rb/tweet_sanitizer)
[![Build Status](https://travis-ci.org/sue445/tweet_sanitizer.svg?branch=master)](https://travis-ci.org/sue445/tweet_sanitizer)
[![Code Climate](https://codeclimate.com/github/sue445/tweet_sanitizer.png)](https://codeclimate.com/github/sue445/tweet_sanitizer)
[![Coverage Status](https://coveralls.io/repos/github/sue445/tweet_sanitizer/badge.svg?branch=master)](https://coveralls.io/github/sue445/tweet_sanitizer?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/sue445/tweet_sanitizer.svg)](https://gemnasium.com/github.com/sue445/tweet_sanitizer)

This is extension of [twitter](https://github.com/sferik/twitter). Sanitize `Twitter::Tweet#text`

## Example
```ruby
tweet = @client.status("https://twitter.com/github/status/866677968608927744")
tweet.text
#=> "Introducing GitHub Marketplace, a new place to browse and buy integrations using your GitHub account.… https://t.co/dK0Tmcmm72"
```

```ruby
using TweetSanitizer::TwitterExtension

extended_tweet = @client.status("https://twitter.com/github/status/866677968608927744", tweet_mode: "extended")
extended_tweet.sanitized_text
#=> "Introducing GitHub Marketplace, a new place to browse and buy integrations using your GitHub account. https://github.com/blog/2359-introducing-github-marketplace-and-more-tools-to-customize-your-workflow"
```

## Features
* Expand urls in `Twitter::Tweet#text` (e.g. `t.co` url -> original url)
* Remove media urls in `Twitter::Tweet#text`
* Unescape special html characters in `Twitter::Tweet#text` (e.g. `(&gt; &lt;)` -> `(> <)`)

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
### Case 1. Use `TweetSanitizer::TwitterExtension` and `Twitter::Tweet#sanitized_text` (Recommended)
```ruby
using TweetSanitizer::TwitterExtension

extended_tweet = @client.status("https://twitter.com/github/status/866677968608927744", tweet_mode: "extended")
extended_tweet.sanitized_text
```

### Case 2. Use `TweetSanitizer.sanitize`
```ruby
extended_tweet = @client.status("https://twitter.com/github/status/866677968608927744", tweet_mode: "extended")
TweetSanitizer.sanitize(extended_tweet)
```

### :warning: Note
When you get `Twitter::Tweet` instance, pass `tweet_mode: "extended"` option to methods. (e.g. `Twitter::REST::Client#status`, `Twitter::REST::Client#search`)

Because `full_text` attribute is returned when **only** `tweet_mode=extended` is passed to Twitter API

See following.

https://dev.twitter.com/overview/api/upcoming-changes-to-tweets

## Development

```bash
cp .env.example .env
vi .env
./bin/console
```

```ruby
[1] pry(main)> @client.status("https://twitter.com/sue445/status/896748477262082049", tweet_mode: "extended")
=> #<Twitter::Tweet id=896748477262082049>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/tweet_sanitizer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
