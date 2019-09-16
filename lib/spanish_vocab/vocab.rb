module SpanishVocab
  class Vocab
    attr_accessor :spanish, :translation
    @@all = []

    def initialize
      @@all << self
    end

    def self.all
      @@all
    end
  end
end