# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require "json"

# i_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# cts_s = open(i_url).read
# cts = JSON.parse(cts_s)
# # cts.delete_at[0]
# Ingredient.delete_all

# cts["drinks"].each do |cocktail|
#   Ingredient.create(name: cocktail["strIngredient1"])
# end


c_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
cts_c = open(c_url).read
cts_fr = JSON.parse(cts_c)

cts_fr["drinks"].each do |cocktail|
  Cocktail.create(name: cocktail["strDrink"])
end
