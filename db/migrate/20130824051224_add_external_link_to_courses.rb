class AddExternalLinkToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :external_link, :string
  end
end
