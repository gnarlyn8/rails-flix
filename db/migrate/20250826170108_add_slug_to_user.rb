class AddSlugToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :slug, :string
  end
end
