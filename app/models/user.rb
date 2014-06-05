class User < ActiveRecord::Base
  include Attachable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # square: resize to 50x50, cropping to the center(#)
  # thumb: resize to 100px wide, keeping aspect ratio
  # large: resize up to 500px wide without stretching, keeping aspect ratio
  # options: compress 10%, strip meta tags, save as progressive (if jpg)
  has_attachment :avatar, styles: {tiny_square: "50x50#", thumb: "100", large: "500>"},
                          convert_options: { all: '-quality 90 -strip -interlace Plane'},
                          encrypted_storage: true,
                          default_asset: 'anonymous_user.jpg'

  validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)

  def to_s
    self.name || self.email
  end

  protected
    def devise_mailer
      UserMailer
    end
end
