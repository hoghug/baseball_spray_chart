class Hit < ActiveRecord::Base
  belongs_to :player
  belongs_to :hit_type
end
