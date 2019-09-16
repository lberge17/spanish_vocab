module SpanishVocab
  class Topic
    attr_accessor :name, :link, :vocabulary
    @@all = []
    
    def initialize(topic_hash)
      topic_hash.each{|k, v| self.send(("#{k}="), v)}
      @@all << self
    end

    #define a function to add vocabulary to the Topic instance
    
    def self.create_from_collection(topic_array)
      topic_array.each {|topic_hash| topic = SpanishVocab::Topic.new(topic_hash)}
    end
    
    def self.all
      @@all
    end
    
  end
end