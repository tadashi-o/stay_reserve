class AddPepoleToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :pepole, :integer
  end
end
