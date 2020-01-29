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

  #owner can buy cat
  def buy_cat(name)
  end

  #owner can buy dog
  def buy_dog(name)
  end

  def get_cat
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners = []
  end

  def cats
    
  end

end

#owner.name = name