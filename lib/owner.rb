require_relative './dog.rb'
require_relative './cat.rb'

require 'pry'

class Owner
  attr_reader :name, :species
  @@owners = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
  end
  
  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@owners
  end

  def self.count #make it depend on another method instead of repeating a variable - less breakable
    self.all.length
    # @@owners.length
  end

  def self.reset_all #make it depend on another method
    self.all.clear
    # @@owners = []
  end

  #! expect(@owner.cats[0]).to eq(cat_1)
  def cats
    Cat.all.select{ |cat|
      cat.owner == self
    }
  end

  def dogs
    Dog.all.select{ |dog|
      dog.owner == self
    }
  end

  #owner can buy cat
  def buy_cat(name)
    Cat.new(name, self)
  end

  #owner can buy dog
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs

    self.dogs.map {|dog| dog.mood="happy"}

  end
 
  def feed_cats

    self.cats.map {|cat| cat.mood="happy"}
    
  end

  def sell_pets   #can make an array of cats & dogs to avoid repetition
    pets = self.cats + self.dogs
    
    pets.map{ |pet| 
      pet.mood="nervous"
      pet.owner= nil
    }
  end

  def list_pets
     "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end

# owner.name = name

# Hermione = Owner.new("Hermione")
# Cat.new("Crooks", Hermione)
# Cat.new("Crookshanks", Hermione)
# Cat.new("Shanks", Hermione)

# p Hermione.feed_cats


