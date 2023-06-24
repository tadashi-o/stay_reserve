class ChangeDatatypeCheckoutOfReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :checkout, :date
  end
end
