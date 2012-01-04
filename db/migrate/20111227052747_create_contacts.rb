class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :contact_type
      t.string :plans
      t.text :content

      t.timestamps
    end
  end
end
