class CreateBids < ActiveRecord::Migration
  def change
      create_table :bids do |t|
      t.integer  :item_id,     :null => false
      t.integer  :user_id,     :null => false
      t.decimal  :amount,      :null => false, :precision => 20, :scale => 2

      t.timestamps :null => false
    end
  end
end
