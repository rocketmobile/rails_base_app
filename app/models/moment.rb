class Moment < ActiveRecord::Base
  include VerboseErrors

  belongs_to :lapse
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # validates :image, presence: true
  validates :lapse, presence: true
  validates :active, presence: true

end
