module SpanishVocab
  class Vocab
    attr_accessor :spanish, :translation
    @@all = []

    def initialize(vocab_hash)
      vocab_hash.each{|k, v| self.send(("#{k}="), v)}
      @@all << self
    end

    def self.all
      @@all
    end
  end
end