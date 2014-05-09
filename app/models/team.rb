class Team < ActiveRecord::Base
  has_many :players

  geocoded_by :address
  after_validation :geocode

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :stadium_chart, :styles => {:large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :stadium_chart, :content_type => /\Aimage\/.*\Z/
end
