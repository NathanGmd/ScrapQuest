class CreateFilters < ActiveRecord::Migration[7.1]
  def change
    create_table :filters do |t|
      t.integer :max
      t.integer :min
      t.references :option, null: true, foreign_key: true
      t.references :research, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
