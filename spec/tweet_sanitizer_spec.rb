RSpec.describe TweetSanitizer do
  describe ".sanitize" do
    subject { TweetSanitizer.sanitize(tweet) }

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
          media: [],
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” http://htn.to/RC5eJf",
        },
        "https://twitter.com/sue445/status/866632269183598592" => {
          id: 866632269183598592,
          text: "RT @SazaeSurrealism: #sazae #sazaesan https://t.co/6kTKig4Cib",
          urls: [],
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
          expected: "RT @SazaeSurrealism: #sazae #sazaesan",
        },
      }
    end

    with_them do
      let(:tweet) do
        Twitter::Tweet.new(
          id:       id,
          text:     text,
          entities: { urls: urls, media: media }
        )
      end

      it { should eq expected }
    end
  end

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

  describe ".remove_media_urls_in_tweet" do
    subject {TweetSanitizer.remove_media_urls_in_tweet(tweet, tweet.text)}

    where do
      {
        "https://twitter.com/sue445/status/866632269183598592" => {
          id: 866632269183598592,
          text: "RT @SazaeSurrealism: #sazae #sazaesan https://t.co/6kTKig4Cib",
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
          expected: "RT @SazaeSurrealism: #sazae #sazaesan",
        },
        "https://twitter.com/sue445/status/866636479061147648" => {
          id: 866636479061147648,
          text: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
          media: [],
          expected: "“GitHubのリポジトリをDprecatedにするスクリプト | Web Scratch” https://t.co/vG7cvDAMEb",
        },
      }
    end

    with_them do
      let(:tweet) do
        Twitter::Tweet.new(
          id:       id,
          text:     text,
          entities: { media: media },
        )
      end

      it { should eq expected }
    end
  end
end
