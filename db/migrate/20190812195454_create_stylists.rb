class CreateStylists < ActiveRecord::Migration[5.2]
  def change
    create_table :stylists do |t|
      t.string :name
      t.string :specialty

      t.timestamps
    end
  end
end
