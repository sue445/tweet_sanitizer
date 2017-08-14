RSpec.describe TweetSanitizer::TwitterExtension do
  describe "#sanitized_text" do
    subject { tweet.sanitized_text }

    using TweetSanitizer::TwitterExtension

    include StubUtil

    let(:tweet) { tweet1 }

    it { should eq "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf" }
  end
end