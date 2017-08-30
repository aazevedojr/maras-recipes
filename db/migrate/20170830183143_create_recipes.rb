class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :directions
      t.integer :difficulty
      t.integer :prep_time
      t.integer :creator_id
      t.integer :category_id

      t.timestamps
    end
  end
end
