class ChangeDatatypeCheckinOfReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :checkin, :date
  end
end
