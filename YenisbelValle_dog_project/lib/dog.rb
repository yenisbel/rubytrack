class Dog
    def initialize(name, breed, age, bark, favorite_foods)
      @name = name
      @breed = breed
      @age = age
      @bark = bark
      @favorite_foods = favorite_foods
    end
  
    def name
      @name
    end
  
    def breed
      @breed
    end
  
    def age
      @age
    end
  
    def bark
      @bark
    end
  
    def favorite_foods
      @favorite_foods
    end
  
    def age=(value)
      @age = value
    end
  
  
    def bark
      if @age > 3
        return @bark.upcase
      else
        return @bark.downcase
      end
    end
  
  
    def favorite_food?(food_item)
      @favorite_foods.any?{|name_food| name_food.downcase.include?(food_item.downcase)}
    end
  end
