class Room < ApplicationRecord
    belongs_to :user

    mount_uploader :facility_img, FacilityUploader

end
