class Allergies

  def initialize(number)
    @number = number
    @allergens = {
        "eggs" => 1,
        "peanuts" => 2,
        "shellfish" => 4,
        "strawberries" => 8,
        "tomatoes" => 16,
        "chocolate" => 32,
        "pollen" => 64,
        "cats" => 128
    }

    @active_allergies = []

  end

  def allergic_to?(allergen)
    determine_allergies
    @active_allergies.include?(allergen)
  end

  # Loop through allergens, comparing number to each value.
  # Find the highest possible value that can be subtracted from number
  # Subtract it, add that key to the active_allergies array and repeat.

  def determine_allergies
    @allergens.each_with_index do |val, index|
      keys = @allergens.keys
        if @number <= val[1] && @number > 0
          @active_allergies << keys[index - 1]
          @number = @number - val[1]
        elsif @number == val[1]
          @active_allergies << keys[index]
          @number = @number - val[1]
          break
        end
     end
    puts @number
    puts @active_allergies
  end

  def list
    @active_allergies
  end

end
