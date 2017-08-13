require "tweet_sanitizer/version"
require "twitter"

module TweetSanitizer
  # @param tweet [Twitter:Tweet]
  # @return [String]
  def self.expand_urls_text(tweet)
    text = tweet.text.dup
    return text unless tweet.uris?

    tweet.uris.reverse.each_with_object(text) do |uri, expanded|
      pos1 = uri.indices[0]
      pos2 = uri.indices[1]
      expanded[pos1, pos2] = uri.expanded_url
    end
  end

  # @param tweet [Twitter:Tweet]
  # @param text [String]
  # @return [String]
  def self.remove_media_urls_in_tweet(tweet, text)
    text = text.dup
    return text unless tweet.media?

    tweet.media.each_with_object(text) do |media, t|
      t.gsub!(media.url, "")
      t.strip!
    end
  end
end
