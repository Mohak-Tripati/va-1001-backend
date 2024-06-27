class CreatePerspectives < ActiveRecord::Migration[7.1]
  def change
    create_table :perspectives do |t|
      t.string :perspective_name

      t.timestamps
    end
  end
end
