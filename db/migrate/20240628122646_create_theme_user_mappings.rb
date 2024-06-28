class CreateThemeUserMappings < ActiveRecord::Migration[7.1]
  def change
    create_table :theme_user_mappings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
