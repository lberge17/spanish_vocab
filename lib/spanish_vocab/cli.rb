module SpanishVocab
  class CLI
    def run
      loading_message
      make_topics
      add_vocab
      list_commands
      main_menu
    end

    def loading_message
      puts "Loading application..."
      puts "-----------------------------"
      puts "While you're waiting, get excited to learn some new Spanish vocabulary!"
      puts "With this application, you can learn around 900 Spanish vocab words with vocab lists, flashcards, and a short quiz."
      puts "-----------------------------"
    end

    def make_topics
      topic_array = SpanishVocab::Scraper.scrape("https://www.e-spanyol.com/basic-spanish-vocabulary.php")
      SpanishVocab::Topic.create_from_collection(topic_array)
    end

    def add_vocab
      SpanishVocab::Topic.all.each do |topic|
        if topic.name == "Time, days, months"
           topic.add_vocabulary(SpanishVocab::Scraper.scrape_time_vocab("https://www.e-spanyol.com/" + topic.link))
        else
          topic.add_vocabulary(SpanishVocab::Scraper.scrape_vocab("https://www.e-spanyol.com/" + topic.link))
        end
      end
    end

    def list_commands
      puts "Type 'list' to view and select a topic"
      puts "Type 'study' to test your knowledge with flashcard mode"
      puts "Type 'quiz' to take a quiz on 10 random vocab words"
      puts "Type 'exit' to exit the program"
    end

    def main_menu
      loop do
        puts "-----------------------------"
        puts "----------MAIN MENU----------"
        puts "What would you like to do?"
        puts "Type 'options' to see options again."
        input = gets.chomp
        puts ""
        if input.to_i.between?(1, SpanishVocab::Topic.all.size)
          display_vocab(input.to_i - 1)
        elsif input == "options"
          list_commands
        elsif input == "list"
          list_topics
        elsif input == "study"
          flashcards
        elsif input == "quiz"
          quiz
        elsif input == "exit"
          break
        else
          puts "I'm sorry, I don't think I understood."
        end
      end
    end

    def list_topics
      Topic.all.each_with_index{|topic, index| puts "Type #{index + 1} for #{topic.name}"}
    end

    def display_vocab(n)
      SpanishVocab::Topic.all[n].vocabulary.each do |vocab|
        puts "#{vocab.translation} - #{vocab.spanish}"
      end
    end

    def flashcards
      puts "-----------------------------"
      puts "-------FLASHCARDS MODE-------"
      loop do
        puts ""
        puts "Would you like the test words in English or in Spanish? Type 'e' or 's'."
        puts "Note: if you wish to exit this mode you can type 'exit' at any time."
        input = gets.chomp
        if input == "e" || input == "s"
          flashcard_set(input)
        elsif input == "exit"
          "Exiting flashcards mode."
          break
        else
          puts "Invalid input. Let's try this again."
        end
      end
    end

    def flashcard_set(language)
      puts "Enter the number of the topic you want to test your knowledge in:"
      puts "If you can't remember the numbers, type list to see topics."
      input = gets.chomp
      if input == "exit"
        puts "Back to flashcards menu:"
      elsif input == "list"
        list_topics
        flashcard_set(language)
      elsif input.to_i.between?(1, SpanishVocab::Topic.all.size)
        SpanishVocab::Topic.all[input.to_i - 1].vocabulary.each do |vocab|
          if language == "e"
            question = vocab.translation
            answer = vocab.spanish
          else
            question = vocab.spanish
            answer = vocab.translation
          end
          puts "How do you say #{question}?"
          input = gets.chomp
          if input == answer
            puts "Correct! Next:"
          elsif input == "exit"
            puts "Back to flashcards menu:"
            break
          else
            puts "That's not the answer I have. Hint: It starts with #{answer.split("")[0]}"
            input = gets.chomp
            if input == answer
              puts "Correct! Second time's the charm. Next:"
            elsif input == "exit"
              break
            else
              puts "Sorry, the answer was #{answer}. Next:"
            end
          end
        end
      else
        puts "Invalid input. Let's try this again."
        flashcard_set(language)
      end
    end

    def quiz
      puts "-----------------------------"
      puts "----------QUIZ MODE----------"
      puts "Don't stress, this won't go on your report card!"
      puts "To leave quiz mode you can type 'exit' at any point"
      loop do
        puts ""
        puts "Starting new quiz..."
        puts "Would you like to view the words in English or Spanish? Type 'e' or 's'"
        input = gets.chomp
        if input == 'e' || input =='s'
          quiz_set(input)
        elsif input == 'exit'
          break
        else
          puts "Invalid input. Let's try this again."
        end
      end
    end

    def quiz_set(language)
      count = 0
      review = []
      10.times do
        vocab = SpanishVocab::Vocab.all[rand(0...SpanishVocab::Vocab.all.size)]
        if language == "e"
          question = vocab.translation
          answer = vocab.spanish
        else
          question = vocab.spanish
          answer = vocab.translation
        end
        puts ""
        puts "How do you say #{question}?"
        input = gets.chomp
        if input == "#{answer}"
          count += 1
        elsif input == "exit"
          puts "Exiting quiz."
          break
        else
          review << answer
        end
      end
      puts ""
      puts "You got #{count} out of 10 questions correct."
      if count != 10
        puts ""
        puts "You might want to review: #{review.join(", ")}"
      end
    end
  end
end
