# == Schema Information
#
# Table name: images
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  lesson_id            :integer
#  lesson_template_id   :integer
#

class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :lesson
  belongs_to :lesson_template

  attr_accessible :picture
  has_attached_file :picture

  validates_attachment :picture, :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..5000.kilobytes }  
end
