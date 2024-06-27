class CreateThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :themes do |t|
      t.string :theme_name
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
