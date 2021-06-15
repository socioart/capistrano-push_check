# capistrano/push_check

This gem check local git branch before all Capistrano tasks, to prevents deployment with unpushed branch.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-push_check'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-push_check

## Usage

Add line below to `Capfile`.

```ruby
require "capistrano/push_check"
```

When you run `cap` command (with stage name), checks local branch. And if it is wrong, prints message below and abort deployment.

        ================================================================================
        !!! Local branch `master` is ahead of upstream by 1 commit(s). !!!
        ================================================================================

If you want to skip check, please set `skip_push_check` variable to `true`.

```ruby
set :skip_push_check, true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/labocho/capistrano-push_check.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
