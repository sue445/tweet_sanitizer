RSpec.describe TweetSanitizer do
  describe ".expand_urls_text" do
    subject { TweetSanitizer.expand_urls_text(tweet) }

    where do
      {
        "https://twitter.com/sue445/status/866636479061147648" => {
          id: 866636479061147648,
          text: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
          urls: [
            {
              url:          "https://t.co/vG7cvDAMEb",
              expanded_url: "http://htn.to/RC5eJf",
              display_url:  "htn.to/RC5eJf",
              indices:      [47, 70],
            }
          ],
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf",
        },
      }
    end

    with_them do
      let(:tweet) do
        Twitter::Tweet.new(
          id:       id,
          text:     text,
          entities: { urls: urls }
        )
      end

      it { should eq expected }
    end
  end
end
