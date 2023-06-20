class RemoveFacilityDetailFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :facility_detail, :text
  end
end
