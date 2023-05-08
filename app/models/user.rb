class User < ApplicationRecord
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
    after_initialize :set_role
    has_secure_password validations: false

    has_many :meetups
    has_many :comments, dependent: :destroy

    def set_role
        self.role ||= :user
    end

end
