class User < ActiveRecord::Base
  include BCrypt

  has_many :listed_items, class_name: "Item"
  has_many :bids, class_name: "Bid"
  has_many :bid_on_items, through: :bids, source: :item


  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, exclusion: { in: %w(login logout new admin),
    message: "cannot be used" }

  def has_bid_on(item)
    Bid.where(bidder: self, item: item).any?
  end

  def won_items
    self.bid_on_items.includes(:bids).to_a.select{ |item| item.ended? && item.high_bidder == self}
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
