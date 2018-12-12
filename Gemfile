source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in tweet_sanitizer.gemspec
gemspec

if Gem::Version.create(RUBY_VERSION) < Gem::Version.create("2.5.0")
  group :test do
    # NOTE: unparser v0.3.0+ requires Ruby 2.5+
    gem "unparser", "< 0.3.0"
  end
end
