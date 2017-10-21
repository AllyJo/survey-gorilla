class Choice < ActiveRecord::Base
  has_many :responses
  belongs_to :question
  has_one :survey, through: :question
end
