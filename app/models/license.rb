class License < ApplicationRecord
  belongs_to :organization
  has_many :activation_codes

  def ac_count
    self.activation_codes.count
  end
end
