class AddThumbnailToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :img_url, :text, default: "https://images.unsplash.com/photo-1517093911940-08cb5b3952e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1283&q=80"
  end
end
