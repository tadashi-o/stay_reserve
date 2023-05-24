class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :facility_img
      t.string :facility_name
      t.text :facility_detail
      t.integer :total_amount
      t.datetime :checkin
      t.datetime :checkout
      t.integer :user_id

      t.timestamps
    end
  end
end
