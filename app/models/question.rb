class Question < ActiveRecord::Base
  has_many :choices
  has_many :responses, through: :choices
  belongs_to :survey
end
