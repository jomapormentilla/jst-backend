class Activity < ApplicationRecord
    belongs_to :week

    # validates :size, inclusion: { in: %w(small medium large),
    #     message: "%{value} is not a valid size" }
end
