class CreateSevices < ActiveRecord::Migration[5.1]
  def change
    create_table :sevices do |t|
      t.string :name
      t.float :cost
      t.int :time

      t.timestamps
    end
  end
end
