class AddGroupDescriptionToGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :group_description, :string
  end
end
