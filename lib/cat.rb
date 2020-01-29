class Cat
  attr_reader :name
  attr_accessor :owner, :mood

  @@cats = []

  def initialize (name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@cats << self
  end

  def self.all
    @@cats
  end

end