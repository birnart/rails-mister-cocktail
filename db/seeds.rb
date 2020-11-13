# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# i_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# cts_s = open(i_url).read
# cts = JSON.parse(cts_s)
# # cts.delete_at[0]
# Ingredient.delete_all

# cts["drinks"].each do |cocktail|
#   Ingredient.create(name: cocktail["strIngredient1"])
# end
Cocktail.destroy_all
Dose.destroy_all
require 'json'
require 'open-uri'

15.times do
  url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  cts = open(url).read
  cts_p = JSON.parse(cts)
  cts_p["drinks"].each do |cocktail|
    cocktail_new = Cocktail.create(name: cocktail["strDrink"], img_url: cocktail["strDrinkThumb"])
    ing1 = Ingredient.new(name: cocktail["strIngredient1"])
    ing2 = Ingredient.new(name: cocktail["strIngredient2"])
    cocktail["strMeasure1"] ? des1 = cocktail["strMeasure1"] : des1 = "1part"
    cocktail["strMeasure2"] ? des2 = cocktail["strMeasure1"] : des2 = "1part"
    dose1 = Dose.new(description: des1, ingredient: ing1)
    dose2 = Dose.new(description: des2, ingredient: ing2)
    dose1.cocktail_id = cocktail_new.id
    dose2.cocktail_id = cocktail_new.id
    dose1.save!
    dose2.save!
    # p cocktail["strIngredient1"]
    # p cocktail["strMeasure1"]
    # p cocktail["strIngredient2"]
    # p cocktail["strMeasure2"]
    # p cocktail["strIngredient3"]
    # p cocktail["strMeasure3"]
    # p cocktail["strIngredient4"]
    # p cocktail["strMeasure4"]
  end
end

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = open(url).read
result = JSON.parse(list)
result["drinks"].each do |row|
  ingredient = Ingredient.new(name: row['strIngredient1'])
  ingredient.save!
  end


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
