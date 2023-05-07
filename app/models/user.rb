class User < ApplicationRecord
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
    after_initialize :set_role
    has_secure_password validations: false
    alias_attribute :password_digest, :password

    has_many :meetups

    def set_role
        self.role ||= :user
    end

end
