class Item < ActiveRecord::Base
  belongs_to :seller, class_name: "User", foreign_key: "user_id"
  has_many   :bids
  has_many   :bidders, through: :bids, class_name: "User"

  validates :name, :description, :start_time, :end_time, :seller, presence: true

  def self.active_items
    now = DateTime.now
    Item.where("start_time < ? AND end_time > ?", now, now)
  end

  def self.ended_items
    Item.where("end_time <= ?", DateTime.now)
  end

  def active?
    now = DateTime.now
    self.start_time < now && self.end_time > now
  end

  def ended?
    self.end_time <= DateTime.now
  end

  def high_bidder
    self.bids.max.bidder
  end
end
