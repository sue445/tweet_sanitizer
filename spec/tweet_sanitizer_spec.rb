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
        "https://twitter.com/pooza/status/875237065469771776" => {
          tweet: tweet3,
          expected: "テスト https://google.com/ <><>",
        },
        "https://twitter.com/pooza/status/875239983488966656" => {
          tweet: tweet4,
          expected: %Q(もういっちょテスト\nhttps://twitter.com/ <><><>"'"'"'\n&quot;),
        },
        "https://twitter.com/pooza/status/875480815785738240" => {
          tweet: tweet5,
          expected: "IPv6は全然勉強が足りてなくて。\n他はともかく、ひとまずhttp://mstdn.b-shock.orgだけはIPv6リアーチャブルにしてみようかしら。",
        },
        "https://twitter.com/pooza/status/875503517322149888" => {
          tweet: tweet6,
          expected: "TeamOn for SAKURA\nhttp://www.sakura.ne.jp/function/teamon.html\n\nさくらで始めた、グループウェアのサービス。\n1ユーザー1ヶ月あたり、194円。最低5ユーザーから。\nウチで使うにはユーザー数が余るけどw、頭の片隅にでも。",
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
    subject { TweetSanitizer.remove_media_urls_in_tweet(tweet, tweet.text) }

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
