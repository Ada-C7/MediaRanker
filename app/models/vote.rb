class Vote < ApplicationRecord
    belongs_to :work
    belongs_to :user

    def self.already_created (work_id, user_id)
        Vote.where(user_id: user_id, work_id: work_id).present?
    end
end
