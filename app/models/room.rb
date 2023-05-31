class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations

    mount_uploader :facility_img, FacilityUploader

end
