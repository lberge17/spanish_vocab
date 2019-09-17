# SpanishVocab

This gem uses nokogiri to parse through spanish vocabulary words from "https://www.e-spanyol.com/basic-spanish-vocabulary.php". It then uses this data to make a CLI application where the user can view vocabulary lists by topic or test their knowledge in a given topic.

The application starts by showing the user the different options for how to interact with the vocab. These ways include a list mode, flashcard mod, and a quiz mode. The list mode simply lists the vocab of a given topic showing both the spanish word and translation. Theflashcard/study mode shows the user either the word and asks the user to type in the answer--if the user gets a word wrong they get one more try with a hint showing the first letter before the answer is revealed. The quiz mode takes ten random words from all the topics and asks the user to provide the answer--it shows how many questions the user got correct at the end and which words the user may want to review(i.e. the answers to the questions that were incorrect). Both flashcard and study mode can be given in either language, the user decides.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spanish_vocab'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spanish_vocab

## Usage

Run bin/run in the terminal while in the spanish_vocab directory to open the CLI application.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lberge17/spanish_vocab. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SpanishVocab project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lberge17/spanish_vocab/blob/master/CODE_OF_CONDUCT.md).
