class Condition < ActiveHash::Base
  self.data = [
    { id: 1, condition: '---' },
    { id: 2, condition: '未使用に近い' },
    { id: 3, condition: 'やや傷や汚れあり' },
    { id: 4, condition: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end