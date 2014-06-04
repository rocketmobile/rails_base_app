class Lapse < ActiveRecord::Base

  has_many :moments, dependent: :destroy

  validates :name, presence: true

end
