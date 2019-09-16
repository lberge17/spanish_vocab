module SpanishVocab
  class Topic
    attr_accessor :name, :link, :vocabulary
    @@all = []
    
    def initialize
      @vocabulary = []
      @@all << self
    end
    
    def self.all
      @@all
    end
    
  end
end