# SpanishVocab

This gem uses nokogiri to parse through spanish vocabulary words from "https://www.e-spanyol.com/basic-spanish-vocabulary.php". It then uses this data to make a CLI application where the user can view vocabulary lists by topic or test their knowledge in a given topic.

The application starts by showing the user the different options for how to interact with the vocab. These ways include a list mode, flashcard mod, and a quiz mode. The list mode simply lists the vocab of a given topic showing both the spanish word and translation. Theflashcard/study mode shows the user either the word and asks the user to type in the answer--if the user gets a word wrong they get one more try with a hint showing the first letter before the answer is revealed. The quiz mode takes ten random words from all the topics and asks the user to provide the answer--it shows how many questions the user got correct at the end and which words the user may want to review(i.e. the answers to the questions that were incorrect). Both flashcard and study mode can be given in either language, the user decides.

## Installation

Fork this repo and clone it.

And then from the project directory execute:

    $ bundle

## Usage

In order to run the application, execute:

    $ bin/run

May need to give the file executable permissions:

    $ chmod +x bin/run
    
If you don't want to give executable permissions, you can also run the file by executing:

    $ ruby bin/run

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lberge17/spanish_vocab. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The repo is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SpanishVocab project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lberge17/spanish_vocab/blob/master/CODE_OF_CONDUCT.md).
