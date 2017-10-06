Miso Buddy
==========

**Your Very Own Terminal Buddy**

Re-vamp of Jarbs, currently under construction... :hammer:

## Installation

    $ gem install miso-buddy

## Usage

`miso`. Yeah.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/test` to run the tests. You can also run `bin/console` for an interactive [pry](http://pryrepl.org/) prompt.

If you're changing the man page, generate roff and html files with `bin/ronn`.

To install this gem onto your local machine, run `bin/install`.

To release a new version, first update the version number in `lib/miso_buddy/version.rb`, then build the gem with `bundle exec rake build`. Install locally and confirm nothing broke, push a commit [Major, Minor, Patch] version bump. Now you can push the `.gem` file to [rubygems.org](https://rubygems.org) with `gem push pkg/miso-buddy-VERSION.gem`. Throw a git tag on there `bin/tag`.

Miso Buddy uses an internal MVC framework to handle all the possible `routes` for the (heretofor generously named) natural language ui. Basically, its a flat menu of input matchers (like url matching), only it's just a simple string includes keywords sort of thing. To add a new route, just throw one in `lib/miso_router.rb` and add a controller with a matching class name. No models yet, but will come (especially once interacting with REST API's). Also no views yet but will come with a more sophistocated replacement for the `Jarbisms` from before.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fonsecapeter/miso-buddy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the miso-buddy project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fonsecapeter/miso-buddy/blob/master/CODE_OF_CONDUCT.md).
