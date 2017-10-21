class Response < ActiveRecord::Base
  belongs_to :survey_taker, class_name: "User"
  belongs_to :choice
  has_one :survey, through: :choice
end
