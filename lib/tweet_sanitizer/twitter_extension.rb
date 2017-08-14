module TweetSanitizer
  module TwitterExtension
    refine(Twitter::Tweet) do
      # @return [String]
      def sanitized_text
        TweetSanitizer.sanitize(self)
      end
    end
  end
end
