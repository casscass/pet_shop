class CreateSevices < ActiveRecord::Migration[5.1]
  def change
    create_table :sevices do |t|
      t.string :name
      t.float :cost
      t.integer :time

      t.timestamps
    end
  end
end
