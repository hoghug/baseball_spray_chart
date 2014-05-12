class Player < ActiveRecord::Base
  has_many :hits
  belongs_to :team

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def batting_average(hits, at_bats)
    ".#{(sprintf "%.3f", (hits.to_f / at_bats.to_f).round(3)).split('.')[1]}"
  end

  def slugging(singles, doubles, triples, homeruns, at_bats)
    ".#{(sprintf "%.3f", (singles + (doubles * 2) + (triples * 3) + (homeruns * 4)).to_f / at_bats.to_f).split('.')[1]}"
  end

end
