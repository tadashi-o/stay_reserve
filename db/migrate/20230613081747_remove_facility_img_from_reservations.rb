class RemoveFacilityImgFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :facility_img, :string
  end
end
