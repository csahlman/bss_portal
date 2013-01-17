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
#  lesson_template_id    :integer
#

class Attachment < ActiveRecord::Base  
  attr_accessible :document, :document_url

  attr_accessor :document_url

  belongs_to :lesson
  belongs_to :lesson_template
  has_attached_file :document

  validates_attachment :document, :presence => true,
    :size => { :in => 0..5000.kilobytes }

  before_validation :download_remote_file, if: :document_url_provided?

  private

    def document_url_provided?
      self.document_url.present?         
    end  

    def download_remote_file
      self.document = store_remote_file
    end

    def store_remote_file
      io = open(URI.parse(document_url))
      def io.original_filename
        base_uri.path.split('/').last
      end
      io.original_filename.blank? ? nil : io
        rescue Exception => exc
        logger.debug "ERROR WHEN DOWNLOADING FROM #{document_url} - ERROR IS #{exc.message}"
    end  
end
