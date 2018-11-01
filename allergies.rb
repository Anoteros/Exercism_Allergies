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
    loop do
      if @number > 0
        determine_allergies
      else
        break
      end
    end

    @active_allergies.include?(allergen)
  end

  # Loop through allergens, comparing number to each value.
  # Find the highest possible value that can be subtracted from number
  # Subtract it, add that key to the active_allergies array and repeat.

  def determine_allergies
    @allergens.each_with_index do |(allergen_name, allergen_value), index|
      keys = @allergens.keys
        if @number < allergen_value && @number > 0
          @active_allergies << keys[index - 1]
          @number = @number - @allergens[keys[index - 1]]
          break
        elsif @number == allergen_value
          @active_allergies << keys[index]
          @number = @number - allergen_value
          break
        end
     end
  end

  def list
    @active_allergies
  end

end
