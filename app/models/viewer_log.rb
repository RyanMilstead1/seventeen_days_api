class ViewerLog < ApplicationRecord
  belongs_to :user
  belongs_to :app_marker
end
