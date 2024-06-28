class AddPerspectiveDescriptionToPerspective < ActiveRecord::Migration[7.1]
  def change
    add_column :perspectives, :perspective_description, :string
  end
end
