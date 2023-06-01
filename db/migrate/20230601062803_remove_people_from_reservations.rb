class RemovePeopleFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :people, :integer
  end
end
