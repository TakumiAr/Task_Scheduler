class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    has_many :tasks, dependent: :destroy

    private

    def destroy_check
        throw(:abort) if User.where(admin: true).length == 1
    end
end
