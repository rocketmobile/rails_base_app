class Lapse < ActiveRecord::Base

  has_many :moments

  validates :name, presence: true

end
