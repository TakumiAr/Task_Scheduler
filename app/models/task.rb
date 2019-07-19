class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    scope :search_status, -> (params){ where(status: params) }
    scope :search_title, -> (params){ where('title LIKE ?', "%#{params}%") }
end