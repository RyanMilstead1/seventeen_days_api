class Response < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :survey
  belongs_to :organization
  belongs_to :teacher
end
