module StubUtil
  # https://twitter.com/sue445/status/866636479061147648
  def tweet1
    Twitter::Tweet.new(
      id: 866636479061147648,
      text: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
      entities: {
        urls: [
          {
            url:          "https://t.co/vG7cvDAMEb",
            expanded_url: "http://htn.to/RC5eJf",
            display_url:  "htn.to/RC5eJf",
            indices:      [47, 70],
          }
        ],
      },
    )
  end

  # https://twitter.com/sue445/status/866632269183598592
  def tweet2
    Twitter::Tweet.new(
      id: 866632269183598592,
      text: "RT @SazaeSurrealism: #sazae #sazaesan https://t.co/6kTKig4Cib",
      entities: {
        media: [
          {
            id: 866632238015717376,
            id_str: "866632238015717376",
            indices: [38, 61],
            media_url: "http://pbs.twimg.com/media/DAblbcnUIAA5n1O.jpg",
            media_url_https: "https://pbs.twimg.com/media/DAblbcnUIAA5n1O.jpg",
            url: "https://t.co/6kTKig4Cib",
            display_url: "pic.twitter.com/6kTKig4Cib",
            expanded_url: "https://twitter.com/SazaeSurrealism/status/866632239643152384/photo/1",
            type: "photo",
            sizes: {
              large:  {w: 640, h: 480, resize: "fit"},
              medium: {w: 640, h: 480, resize: "fit"},
              thumb:  {w: 150, h: 150, resize: "crop"},
              small:  {w: 640, h: 480, resize: "fit"},
            },
            source_status_id: 866632239643152384,
            source_status_id_str: "866632239643152384",
            source_user_id: 4847387644,
            source_user_id_str: "4847387644",
          }
        ],
      },
    )
  end

  # https://twitter.com/pooza/status/875237065469771776
  def tweet3
    Twitter::Tweet.new(
      id: 875237065469771776,
      text: "テスト https://t.co/jJ90XluMso &lt;&gt;&lt;&gt;",
      entities: {
        hashtags: [],
        symbols: [],
        user_mentions: [],
        urls: [
          {
            url: "https://t.co/jJ90XluMso",
            expanded_url: "https://google.com/",
            display_url: "google.com",
            indices: [4, 27],
          },
        ],
      },
    )
  end

  # https://twitter.com/pooza/status/875239983488966656
  def tweet4
    Twitter::Tweet.new(
      id: 875239983488966656,
      text: "もういっちょテスト\nhttps://t.co/JBu8o4sXsp &lt;&gt;&lt;&gt;&lt;&gt;\"'\"'\"'\n&amp;quot;",
      entities: {
        hashtags: [],
        symbols: [],
        user_mentions: [],
        urls: [
          {
            url: "https://t.co/JBu8o4sXsp",
            expanded_url: "https://twitter.com/",
            display_url: "twitter.com",
            indices: [10, 33],
          },
        ],
      },
    )
  end

  # https://twitter.com/pooza/status/875480815785738240
  def tweet5
    Twitter::Tweet.new(
      id: 875480815785738240,
      text: "IPv6は全然勉強が足りてなくて。\n他はともかく、ひとまずhttps://t.co/f6ssrUsRYYだけはIPv6リアーチャブルにしてみようかしら。",
      entities: {
        hashtags: [],
        symbols: [],
        user_mentions: [],
        urls: [
          {
            url: "https://t.co/f6ssrUsRYY",
            expanded_url: "http://mstdn.b-shock.org",
            display_url: "mstdn.b-shock.org",
            indices: [29, 52]
          },
        ],
      },
    )
  end

  # https://twitter.com/pooza/status/875503517322149888
  def tweet6
    Twitter::Tweet.new(
      id: 875503517322149888,
      text: "TeamOn for SAKURA\nhttps://t.co/7iF72IhI6u\n\nさくらで始めた、グループウェアのサービス。\n1ユーザー1ヶ月あたり、194円。最低5ユーザーから。\nウチで使うにはユーザー数が余るけどw、頭の片隅にでも。",
      entities: {
        hashtags: [],
        symbols: [],
        user_mentions: [],
        urls: [
          {
            url: "https://t.co/7iF72IhI6u",
            expanded_url: "http://www.sakura.ne.jp/function/teamon.html",
            display_url: "sakura.ne.jp/function/teamo…",
            indices: [18, 41],
          },
        ],
      },
    )
  end

  # https://twitter.com/github/status/866677968608927744
  def full_text_tweet1
    Twitter::Tweet.new(
      id: 866677968608927744,
      full_text: "Introducing GitHub Marketplace, a new place to browse and buy integrations using your GitHub account. https://t.co/mPTtAxnU5z https://t.co/Wz2mUql2lc",
      truncated: false,
      display_text_range: [0, 125],
      entities: {
        hashtags: [],
        symbols: [],
        user_mentions: [],
        urls: [
          {
            url: "https://t.co/mPTtAxnU5z",
            expanded_url: "https://github.com/blog/2359-introducing-github-marketplace-and-more-tools-to-customize-your-workflow",
            display_url: "github.com/blog/2359-intr…",
            indices: [102, 125],
          }
        ],
        media: [
          {
            id: 866676750218145792,
            id_str: "866676750218145792",
            indices: [126, 149],
            media_url: "http://pbs.twimg.com/ext_tw_video_thumb/866676750218145792/pu/img/f_HNVOajOKdeyquK.jpg",
            media_url_https: "https://pbs.twimg.com/ext_tw_video_thumb/866676750218145792/pu/img/f_HNVOajOKdeyquK.jpg",
            url: "https://t.co/Wz2mUql2lc",
            display_url: "pic.twitter.com/Wz2mUql2lc",
            expanded_url: "https://twitter.com/github/status/866677968608927744/video/1",
            type: "photo",
            sizes: {
              thumb: {w: 150, h: 150, resize: "crop"},
              medium: {w: 600, h: 338, resize: "fit"},
              small: {w: 340, h: 191, resize: "fit"},
              large: {w: 1024, h: 576, resize: "fit"},
            },
          },
        ],
      },
    )
  end
end
