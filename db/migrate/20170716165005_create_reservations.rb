class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :email
      t.string :name
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
