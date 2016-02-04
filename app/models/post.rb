class Post < ActiveRecord::Base
  has_attached_file :photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  has_many :comments, :dependent => :destroy

end
