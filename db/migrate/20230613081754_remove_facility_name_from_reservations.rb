class RemoveFacilityNameFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :facility_name, :string
  end
end
