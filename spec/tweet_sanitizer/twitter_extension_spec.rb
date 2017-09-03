RSpec.describe TweetSanitizer::TwitterExtension do
  describe "#sanitized_text" do
    context "Without options" do
      subject { tweet.sanitized_text }

      using TweetSanitizer::TwitterExtension

      include FixtureUtil

      let(:tweet) { tweet_fixture("tweet1") }

      it { should eq "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf" }
      it { expect { subject }.not_to change { tweet.text } }
    end

    context "With options" do
      subject do
        tweet.sanitized_text(
          use_retweeted_tweet: use_retweeted_tweet,
          expand_url:          expand_url,
          remove_media_url:    remove_media_url,
          unescape:            unescape,
        )
      end

      include FixtureUtil

      using TweetSanitizer::TwitterExtension
      using RSpec::Parameterized::TableSyntax

      let(:tweet) { tweet_fixture("retweet_full_text_tweet2") }

      where(:use_retweeted_tweet, :expand_url, :remove_media_url, :unescape, :expected) do
        false | false | false | false | "RT @GitHubEducation: Announcing two new GitHub Classroom features: Assignment Deadlines and Class Rosters: https://t.co/bNiJnlps5e https://…"
        true  | false | false | false | "Announcing two new GitHub Classroom features: Assignment Deadlines and Class Rosters: https://t.co/bNiJnlps5e https://t.co/C02G05tUvu"
        false | true  | false | false | "RT @GitHubEducation: Announcing two new GitHub Classroom features: Assignment Deadlines and Class Rosters: https://github.com/blog/2418-github-classroom-now-supports-deadlines-and-class-rosters https://…"
        false | false | true  | false | "RT @GitHubEducation: Announcing two new GitHub Classroom features: Assignment Deadlines and Class Rosters: https://t.co/bNiJnlps5e https://…"
        false | false | false | true  | "RT @GitHubEducation: Announcing two new GitHub Classroom features: Assignment Deadlines and Class Rosters: https://t.co/bNiJnlps5e https://…"
        true  | true  | true  | true  | "Announcing two new GitHub Classroom features: Assignment Deadlines and Class Rosters: https://github.com/blog/2418-github-classroom-now-supports-deadlines-and-class-rosters"
      end

      with_them do
        it { should eq expected }
      end
    end
  end
end
