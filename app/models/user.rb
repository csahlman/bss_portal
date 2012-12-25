# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  name                   :string(255)
#  company                :string(255)
#  guest                  :boolean          default(FALSE)
#  remember_token         :string(255)
#  password_digest        :string(255)
#

class User < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true, format: { with: email_regex },
    uniqueness: { case_sensitive: false }


  before_create :create_remember_token

  has_secure_password

  def set_user_attributes(user_hash)
    self.email = user_hash[:email]
    self.name = user_hash[:name]
    self.company = user_hash[:company]
    self.password = user_hash[:password]
    self.password_confirmation = user_hash[:password_confirmation]  
  end

  private
    
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end
