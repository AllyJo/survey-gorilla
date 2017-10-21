class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: :creator_id
  has_many :responses, foreign_key: :survey_taker_id
  has_many :taken_surveys, -> { distinct }, through: :responses, source: :survey

  validates :username, :first_name, :last_name, :email, presence: true
  validates :taken_surveys, uniqueness: { scope: :survey }
  validate :validate_password

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = Password.create(plain_text_password)
    self.encrypted_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
