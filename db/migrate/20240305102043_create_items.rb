class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.integer :value, null: true
      t.references :feature, null: false, foreign_key: true
      t.references :option, null: true, foreign_key: true
      t.references :prospect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
