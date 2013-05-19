class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :phone_num

      t.timestamps
    end
  end
end
