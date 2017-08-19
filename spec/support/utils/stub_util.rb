module StubUtil
  require "yaml"

  def tweet_fixture(fixture_name)
    yaml_file = spec_dir.join("support", "fixtures", "#{fixture_name}.yml")
    Twitter::Tweet.new(YAML.load_file(yaml_file))
  end
end
