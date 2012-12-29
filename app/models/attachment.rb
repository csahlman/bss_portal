# == Schema Information
#
# Table name: attachments
#
#  id                    :integer          not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  document_file_name    :string(255)
#  document_content_type :string(255)
#  document_file_size    :integer
#  document_updated_at   :datetime
#  lesson_id             :integer
#

class Attachment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :lesson
  attr_accessible :document
  has_attached_file :document

  validates_attachment :document, :presence => true,
    :size => { :in => 0..5000.kilobytes }
end
