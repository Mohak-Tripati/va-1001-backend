class CreatePerspectiveUserMappings < ActiveRecord::Migration[7.1]
  def change
    create_table :perspective_user_mappings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :perspective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
