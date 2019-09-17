Basic Spanish CLI app gem

How the CLI operates
- Greets the user
- lists ways the user can interact with the vocab
- ask the user what they like to do
- can list vocab from a given topic
- can also test user on the vocab of a given topic with flashcards
- can also quiz the user on 10 random vocab words across all topics



What info I need to scrape
- need to be able to access topic on the first page then grab the vocab from topic link
- from the topic link I'm grabbing the spanish word/phrase and the english translation

In order to scrape the data I'm going to build a class called Vocab
- for each Vocab instance it needs a attribute of :translation and :spanish
- these Vocab instances belong to a Topic instance

Topic class
- these topic classes have a :name and :vocabulary attribute
- the :vocabulary attribute is an array containing all the given instances of Vocab within that topic
- all the instances of topic need to be saves in an array so they can be called on to list_topics in the CLI class

Cli Class
- the cli class runs our program by having the functions necessary to execute the application
- given functions include: run, list_topics, display_vocab, flashcards, flashcard_set, quiz, quiz_set, make_topics, and add_vocab_to_topics


