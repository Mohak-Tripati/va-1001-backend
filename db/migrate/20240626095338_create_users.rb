class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :work_email_address
      t.string :password
      t.string :prefered_language
      t.string :ai_assistant
      t.string :profile_image
      t.integer :whatsapp_number
      t.integer :mobile_number
      t.boolean :is_logged_in

      t.timestamps
    end
  end
end
