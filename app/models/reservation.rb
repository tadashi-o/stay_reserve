class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :pepole, presence: true

    validate :date_before_finish

    def date_before_finish
        return if check_out.blank? || check_in.blank?
        errors.add(:check_out, "はチェックイン日より後の日付となるよう選択してください") unless
        self.check_in <= self.check_out
    end

    def days
        (check_out - check_in).to_i
    end

    def total_price
        room.price * pepole * days
    end

end
