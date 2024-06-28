class AddThemeDescriptionToTheme < ActiveRecord::Migration[7.1]
  def change
    add_column :themes, :theme_description, :string
  end
end
