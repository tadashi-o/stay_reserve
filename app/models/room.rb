class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations,dependent: :destroy

    mount_uploader :facility_img, FacilityUploader

    validates :facility_name, presence: true
    validates :facility_detail, presence: true
    validates :price, presence: true
    validates :address, presence: true
    

end
