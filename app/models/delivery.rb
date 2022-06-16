class Delivery < ActiveHash::Base
  self.data = [
    { id: 1, delivery: '---' },
    { id: 2, delivery: '1~2日で発送' },
    { id: 3, delivery: '2~3日で発送' },
    { id: 4, delivery: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end

# ---、1~2日で発送、2~3日で発送、4~7日で発送