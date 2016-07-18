class Games::Console < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def add_stock(amount = 1)
    increment!(:stock, amount)
  end

  def remove_stock(amount = 1)
    decrement!(:stock, amount)
  end
end
