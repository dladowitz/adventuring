class AddRankToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :rank, :integer, :default => 0, :null => false
  end
end
