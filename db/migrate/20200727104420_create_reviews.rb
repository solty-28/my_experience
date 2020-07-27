class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :title
      t.text :review_body
      t.string :picture
      t.string :rating

      t.timestamps
    end
  end
end
