class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|

      t.timestamps
    end
  end
end
