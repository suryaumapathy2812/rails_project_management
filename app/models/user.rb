class User < ApplicationRecord
  has_many :secrets, foreign_key: "user_id"
  has_secure_password

end
