class CreateFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :features do |t|
      t.string :title
      t.string :unit
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
