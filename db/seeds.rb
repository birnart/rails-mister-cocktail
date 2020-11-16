# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# Cocktail.destroy_all
# Dose.destroy_all
# Ingredient.delete_all


10.times do
  url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  cts = open(url).read
  cts_p = JSON.parse(cts)
  cts_p["drinks"].each do |cocktail|
    unless cocktail["strDrink"] == nil
      cocktail_new = Cocktail.create(name: cocktail["strDrink"], img_url: cocktail["strDrinkThumb"], instructions: cocktail["strInstructions"])
      unless cocktail["strIngredient1"] == nil
        ing = Ingredient.new(name: cocktail["strIngredient1"])
        if ing.valid?
          ing.save!
        end
        cocktail["strMeasure1"] ? des1 = cocktail["strMeasure1"] : des1 = "1part"
        dose1 = Dose.new(description: des1, ingredient: ing)
        dose1.cocktail_id = cocktail_new.id
        dose1.save
      end
      unless cocktail["strIngredient2"] == nil
        ing = Ingredient.create(name: cocktail["strIngredient2"])
        ing.save! if ing.valid?
        cocktail["strMeasure2"] ? des2 = cocktail["strMeasure2"] : des2 = "1part"
        dose2 = Dose.new(description: des2, ingredient: ing)
        dose2.cocktail_id = cocktail_new.id
        dose2.save
      end
      unless cocktail["strIngredient3"] == nil
        ing = Ingredient.create(name: cocktail["strIngredient3"])
        ing.save! if ing.valid?
        cocktail["strMeasure3"] ? des3 = cocktail["strMeasure3"] : des3 = "1part"
        dose3 = Dose.new(description: des3, ingredient: ing)
        dose3.cocktail_id = cocktail_new.id
        dose3.save
      end
      unless cocktail["strIngredient4"] == nil
        ing = Ingredient.create(name: cocktail["strIngredient4"])
        ing.save! if ing.valid?
        cocktail["strMeasure4"] ? des4 = cocktail["strMeasure4"] : des4 = "1part"
        dose4 = Dose.new(description: des4, ingredient: ing)
        dose4.cocktail_id = cocktail_new.id
        dose4.save
      end
      unless cocktail["strIngredient5"] == nil
        ing = Ingredient.create(name: cocktail["strIngredient5"])
        ing.save! if ing.valid?
        cocktail["strMeasure5"] ? des5 = cocktail["strMeasure5"] : des5 = "1part"
        dose5 = Dose.new(description: des5, ingredient: ing)
        dose5.cocktail_id = cocktail_new.id
        dose5.save
      end
    end
  end
end
# i_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# cts_s = open(i_url).read
# cts = JSON.parse(cts_s)

# cts["drinks"].each do |cocktail|
#   Ingredient.create(name: cocktail["strIngredient1"])
# end

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# list = open(url).read
# result = JSON.parse(list)
# result["drinks"].each do |row|
#   ingredient = Ingredient.new(name: row['strIngredient1'])
#   ingredient.save!
#   end


# url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
# list = open(url).read
# result = JSON.parse(list)
# alcohol = []
# result["drinks"].each do |row|
#   alcohol << row['idDrink']
# end
# alcohol.each do |id|
#   i_url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}"
#   list = open(i_url).read
#   result = JSON.parse(list)
#   cocktail = Cocktail.new(name: result['drinks'][0]['strDrink'])
#   i_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail.name}"
#   cts_s = open(i_url).read
#   cts = JSON.parse(cts_s)
#   img = cts["drinks"][0]["strDrinkThumb"]
#   cocktail.save!
# end
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name
