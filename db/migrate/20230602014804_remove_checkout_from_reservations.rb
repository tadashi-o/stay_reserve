class RemoveCheckoutFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :checkout, :datetimer
  end
end
