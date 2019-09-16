Basic Spanish CLI app gem

How the CLI operates
- Greets the user
- lists topics of spanish vocab
- ask the user which topic they'd like to explore
- lists the vocab based on user input "(english translation) -- (spanish word/phrase)"
- can also test user on the vocab of a given topic
- prompts the user if they'd like to view another topic or leave



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
- given functions include: run, list_topics, display_vocab, flashcards, flashcards_english, flashcards_spanish, make_topics, and add_vocab_to_topics
- 
##I'd like to make a quiz function that takes 10 random vocab words from Vocab.all and tells the user at the end how many they got wrong and which words they need to review.
