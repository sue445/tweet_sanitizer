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
end
