class CreateProspects < ActiveRecord::Migration[7.1]
  def change
    create_table :prospects do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
