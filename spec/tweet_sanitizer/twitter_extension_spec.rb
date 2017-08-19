RSpec.describe TweetSanitizer::TwitterExtension do
  describe "#sanitized_text" do
    subject { tweet.sanitized_text }

    using TweetSanitizer::TwitterExtension

    include FixtureUtil

    let(:tweet) { tweet_fixture("tweet1") }

    it { should eq "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf" }
    it { expect { subject }.not_to change { tweet.text } }
  end
end
