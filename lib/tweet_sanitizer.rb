require "twitter"
require "tweet_sanitizer/version"
require "tweet_sanitizer/twitter_extension"

module TweetSanitizer
  # Sanitize tweet
  # @param tweet [Twitter:Tweet]
  # @param use_retweeted_tweet [Boolean] Whether use original retweeted tweet if exists
  # @param expand_url          [Boolean] Whether expand url in tweet (e.g. `t.co` url -> original url)
  # @param remove_media_url    [Boolean] Whether remove media url in tweet
  # @param unescape            [Boolean] Whether unescape in tweet (e.g. `(&gt; &lt;)` -> `(> <)`)
  # @return [String]
  def self.sanitize(tweet, use_retweeted_tweet: true, expand_url: true, remove_media_url: true, unescape: true)
    # Original RT status is exists in retweeted_status
    if use_retweeted_tweet && tweet.attrs[:retweeted_status]
      tweet = Twitter::Tweet.new(tweet.attrs[:retweeted_status])
    end

    text = tweet_full_text(tweet)
    text = expand_urls_text(tweet, text) if expand_url
    text = remove_media_urls_in_tweet(tweet, text) if remove_media_url
    text = CGI.unescapeHTML(text) if unescape
    text
  end

  # @param tweet [Twitter:Tweet]
  # @param text [String]
  # @return [String]
  def self.expand_urls_text(tweet, text)
    return text unless tweet.uris?

    tweet.uris.reverse.each_with_object(text.dup) do |uri, expanded|
      pos1 = uri.indices[0]
      pos2 = uri.indices[1]
      expanded[pos1, pos2-pos1] = uri.expanded_url if uri.expanded_url
    end
  end

  # @param tweet [Twitter:Tweet]
  # @return [String] `full_text` attribute if exist
  def self.tweet_full_text(tweet)
    # NOTE: Twitter::Tweet#full_text doesn't returns full_text attribute
    # https://github.com/sferik/twitter/blob/v6.1.0/lib/twitter/tweet.rb#L37-L44
    tweet.attrs[:full_text] || tweet.text
  end

  # @param tweet [Twitter:Tweet]
  # @param text [String]
  # @return [String]
  def self.remove_media_urls_in_tweet(tweet, text)
    return text unless tweet.media?

    tweet.media.each_with_object(text.dup) do |media, t|
      t.gsub!(media.url, "")
      t.strip!
    end
  end
end
