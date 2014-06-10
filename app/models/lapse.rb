class Lapse < ActiveRecord::Base
  include VerboseErrors

  has_many :moments, dependent: :destroy

  validates :name, presence: true

end
