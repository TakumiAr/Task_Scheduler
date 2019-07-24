class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    scope :search_status, -> (params){ where(status: params) }
    scope :search_title, -> (params){ where('title LIKE ?', "%#{params}%") }

    enum priority:{"高":0, "中":1, "低":2}
    belongs_to :user
    has_many :labelings, dependent: :destroy
    has_many :labels, through: :labelings
    accepts_nested_attributes_for :labelings
end