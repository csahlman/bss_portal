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
#  user_id              :integer
#

class Image < ActiveRecord::Base  
  attr_accessible :picture, :picture_url

  attr_accessor :picture_url

  belongs_to :lesson
  belongs_to :lesson_template

  belongs_to :user

  has_attached_file :picture, styles: { thumb: ["50x50#"], mid: ["100x100#"], large: ["300x300#"] }

  validates_attachment :picture, :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..4000.kilobytes }  

  before_validation :download_remote_file, if: :picture_url_provided?
  
  private

    def picture_url_provided?
      self.picture_url.present?         
    end  

    def download_remote_file
      self.picture = store_remote_file
    end

    def store_remote_file
      io = open(URI.parse(picture_url))
      def io.original_filename
        base_uri.path.split('/').last
      end
      io.original_filename.blank? ? nil : io
        rescue Exception => exc
        logger.debug "ERROR WHEN DOWNLOADING FROM #{picture_url} - ERROR IS #{exc.message}"
    end

end
