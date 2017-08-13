include StubUtil

RSpec.describe TweetSanitizer do
  describe ".sanitize" do
    subject { TweetSanitizer.sanitize(tweet) }

    where do
      {
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet1,
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf",
        },
        "https://twitter.com/sue445/status/866632269183598592" => {
          tweet: tweet2,
          expected: "RT @SazaeSurrealism: #sazae #sazaesan",
        },
      }
    end

    with_them do
      it { should eq expected }
    end
  end

  describe ".expand_urls_text" do
    subject { TweetSanitizer.expand_urls_text(tweet) }

    where do
      {
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet1,
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf",
        },
      }
    end

    with_them do
      it { should eq expected }
    end
  end

  describe ".remove_media_urls_in_tweet" do
    subject {TweetSanitizer.remove_media_urls_in_tweet(tweet, tweet.text)}

    where do
      {
        "https://twitter.com/sue445/status/866632269183598592" => {
          tweet: tweet2,
          expected: "RT @SazaeSurrealism: #sazae #sazaesan",
        },
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet1,
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
        },
      }
    end

    with_them do
      it { should eq expected }
    end
  end
end
