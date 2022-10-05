module TweetSanitizer
  module TwitterExtension
    # Sanitize tweet
    #
    # @!method sanitized_text(use_retweeted_tweet: true, expand_url: true, remove_media_url: true, unescape: true)
    #
    # @param use_retweeted_tweet [Boolean] Whether use original retweeted tweet if exists
    # @param expand_url          [Boolean] Whether expand url in tweet (e.g. `t.co` url -> original url)
    # @param remove_media_url    [Boolean] Whether remove media url in tweet
    # @param unescape            [Boolean] Whether unescape in tweet (e.g. `(&gt; &lt;)` -> `(> <)`)
    #
    # @return [String]

    refine(Twitter::Tweet) do
      def sanitized_text(use_retweeted_tweet: true, expand_url: true, remove_media_url: true, unescape: true)
        TweetSanitizer.sanitize(
          self,
          use_retweeted_tweet: use_retweeted_tweet,
          expand_url:          expand_url,
          remove_media_url:    remove_media_url,
          unescape:            unescape,
        )
      end
    end
  end
end
