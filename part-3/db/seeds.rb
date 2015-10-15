require 'Faker'

def seed!
  # create users
  20.times do
    User.create(name: random_username, password: "password")
  end
  users = User.all

  #create items
  100.times do
    Item.create({
      seller:      users.sample,
      name:        random_item_name,
      description: random_item_description,
      start_time:  Faker::Time.backward(3, :all),
      end_time:    Faker::Time.forward(3, :all)
    })
  end

  #add bids
  Item.active_items.each do |item|
    (rand(3..13)).times do
      Bid.create(item: item, bidder: users.sample, amount: rand(10..500))
    end
  end

end

def random_username
  "#{Faker::Internet.user_name}#{Faker::Number.between(1940,2000)}"
end

def random_item_name
  item = [Faker::Commerce.product_name,
   "#{Faker::Commerce.product_name.split(' ')[0..-2].join(' ')} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
   "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
   "#{Faker::Hacker.adjective} #{Faker::Team.creature.singularize}"
   ].sample.titleize
  if rand < 0.1
    "Lot of #{rand(2..50)} #{item.pluralize}"
  else
    item
  end
end

def random_item_description
  Faker::Lorem.paragraph(2, true, 4)
end

seed!