class MakeReviewsAJoinTable < ActiveRecord::Migration[8.0]
  def change
    Review.delete_all
    remove_column :reviews, :name, :string
    add_reference :reviews, :user, null: false, foreign_key: true
  end
end
