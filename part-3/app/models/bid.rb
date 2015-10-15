class Bid < ActiveRecord::Base
  belongs_to :bidder, class_name: "User", foreign_key: "user_id"
  belongs_to :item

  validates :amount, presence: true
  validates :amount, numericality: true
  validates :bidder, uniqueness: { scope: :item, 
    message: "can only bid once"}
end
