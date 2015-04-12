class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  #--VALIDATIONS-----------------------------
  #make sure the user and post who favorite is unique so can only do it once
  validates :user_id, uniqueness: {scope: :post_id}

end
