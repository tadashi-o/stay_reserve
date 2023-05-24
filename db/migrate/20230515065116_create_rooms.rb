class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :facility_name
      t.text :facility_detail
      t.integer :price
      t.string :address
      t.string :facility_img

      t.timestamps
    end
  end
end
