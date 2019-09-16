module SpanishVocab
  class Vocab
    attr_accessor :spanish, :translation
    @@all = []

    def initialize(vocab_hash)
      vocab_hash.each{|k, v| self.send(("#{k}="), v)}
      @@all << self
    end
    
    def self.create_from_collection(vocab_array)
      vocab_array.each {|vocab_hash| vocab = SpanishVocab::Vocab.new(vocab_hash)}
    end

    def self.all
      @@all
    end
  end
end