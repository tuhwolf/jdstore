class Product < ApplicationRecord
  has_many :photos
  accepts_nested_attributes_for :photos
  belongs_to :category

  scope :recent, -> { order("created_at DESC") }
  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user
  has_many :reviews, dependent: :destroy
end
