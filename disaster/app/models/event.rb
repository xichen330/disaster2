class Event < ApplicationRecord
  validates_presence_of :title
  belongs_to :category
  has_many :messages
end
