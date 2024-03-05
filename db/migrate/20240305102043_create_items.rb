class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :gender
      t.string :profession
      t.string :study_lvl
      t.string :nationality
      t.string :language
      t.integer :age
      t.boolean :marital_status
      t.string :city
      t.boolean :children
      t.references :feature, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      t.references :prospect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
