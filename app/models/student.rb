class Student < ApplicationRecord
  before_save {email = self.email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensiticwe: false}, length: {maximum:105}, format: {with: VALID_EMAIL_REGEX}
end 