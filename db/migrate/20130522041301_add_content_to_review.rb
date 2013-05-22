class AddContentToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :content, :text
    remove_column :reviews, :description
  end
end
