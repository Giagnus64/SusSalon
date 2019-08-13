class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :time
      t.belongs_to :client, foreign_key: true
      t.belongs_to :stylist, foreign_key: true

      t.timestamps
    end
  end
end
