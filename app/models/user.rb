class User < ApplicationRecord
    validates :username, presence: true,uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:25}
    has_many :messages
    has_secure_password
end