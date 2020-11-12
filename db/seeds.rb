# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require "json"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cts_s = open(url).read
cts = JSON.parse(cts_s)
# cts.delete_at[0]

cts["drinks"].each do |cocktail|
  Ingredient.create(name: cocktail["strIngredient1"])
end
