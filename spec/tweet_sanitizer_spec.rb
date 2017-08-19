include StubUtil

RSpec.describe TweetSanitizer do
  describe ".sanitize" do
    subject { TweetSanitizer.sanitize(tweet) }

    where do
      {
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet_fixture("tweet1"),
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf",
        },
        "https://twitter.com/sue445/status/866632269183598592" => {
          tweet: tweet_fixture("tweet2"),
          expected: "RT @SazaeSurrealism: #sazae #sazaesan",
        },
        "https://twitter.com/pooza/status/875237065469771776" => {
          tweet: tweet_fixture("tweet3"),
          expected: "テスト https://google.com/ <><>",
        },
        "https://twitter.com/pooza/status/875239983488966656" => {
          tweet: tweet_fixture("tweet4"),
          expected: %Q(もういっちょテスト\nhttps://twitter.com/ <><><>"'"'"'\n&quot;),
        },
        "https://twitter.com/pooza/status/875480815785738240" => {
          tweet: tweet_fixture("tweet5"),
          expected: "IPv6は全然勉強が足りてなくて。\n他はともかく、ひとまずhttp://mstdn.b-shock.orgだけはIPv6リアーチャブルにしてみようかしら。",
        },
        "https://twitter.com/pooza/status/875503517322149888" => {
          tweet: tweet_fixture("tweet6"),
          expected: "TeamOn for SAKURA\nhttp://www.sakura.ne.jp/function/teamon.html\n\nさくらで始めた、グループウェアのサービス。\n1ユーザー1ヶ月あたり、194円。最低5ユーザーから。\nウチで使うにはユーザー数が余るけどw、頭の片隅にでも。",
        },
        "https://twitter.com/github/status/866677968608927744" => {
          tweet: tweet_fixture("full_text_tweet1"),
          expected: "Introducing GitHub Marketplace, a new place to browse and buy integrations using your GitHub account. https://github.com/blog/2359-introducing-github-marketplace-and-more-tools-to-customize-your-workflow",
        },
        "https://twitter.com/TwitterJP/status/897378954415194115" => {
          tweet: tweet_fixture("retweet_full_text_tweet1"),
          expected: "【今週の一枚】皆既日食をわかりやすく解説する動画ができました。太陽と月の「見かけの大きさ」がほぼ同じという偶然が織りなす皆既日食の感動を、美しい映像と音楽で味わってください https://buff.ly/2w5HgaH #国立天文台",
        },
      }
    end

    with_them do
      it { should eq expected }
      it { expect { subject }.not_to change { tweet.text } }
    end
  end

  describe ".expand_urls_text" do
    subject { TweetSanitizer.expand_urls_text(tweet) }

    where do
      {
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet_fixture("tweet1"),
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf",
        },
      }
    end

    with_them do
      it { should eq expected }
      it { expect { subject }.not_to change { tweet.text } }
    end
  end

  describe ".tweet_full_text" do
    subject { TweetSanitizer.tweet_full_text(tweet) }

    where do
      {
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet_fixture("tweet1"),
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
        },
        "https://twitter.com/github/status/866677968608927744" => {
          tweet: tweet_fixture("full_text_tweet1"),
          expected: "Introducing GitHub Marketplace, a new place to browse and buy integrations using your GitHub account. https://t.co/mPTtAxnU5z https://t.co/Wz2mUql2lc",
        },
      }
    end

    with_them do
      it { should eq expected }
      it { expect { subject }.not_to change { tweet.text } }
    end
  end

  describe ".remove_media_urls_in_tweet" do
    subject { TweetSanitizer.remove_media_urls_in_tweet(tweet, tweet.text) }

    where do
      {
        "https://twitter.com/sue445/status/866632269183598592" => {
          tweet: tweet_fixture("tweet2"),
          expected: "RT @SazaeSurrealism: #sazae #sazaesan",
        },
        "https://twitter.com/sue445/status/866636479061147648" => {
          tweet: tweet_fixture("tweet1"),
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
        },
      }
    end

    with_them do
      it { should eq expected }
      it { expect { subject }.not_to change { tweet.text } }
    end
  end
end
