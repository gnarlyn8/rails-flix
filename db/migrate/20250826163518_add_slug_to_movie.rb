class AddSlugToMovie < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :slug, :string
  end
end
