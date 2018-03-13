class CreateTribbles < ActiveRecord::Migration[5.1]
  def change
    create_table :tribbles do |t|
      t.string :spaceship
      t.string :colour
      t.int :quantity

      t.timestamps
    end
  end
end
