class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.belongs_to :perspective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
