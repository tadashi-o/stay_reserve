class RemoveCheckinFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :checkin, :date
  end
end
