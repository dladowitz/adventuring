class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.integer :user_id
      t.integer :organization_id
      t.text :description

      t.timestamps
    end
  end
end
