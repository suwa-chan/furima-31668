class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :postage_payer
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :handling_time

  with_options presence: true do
    validates :image
    validates :name
    validates :info
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handling_time_id
  end

    validates :price, presence: true
    validates :price, inclusion: {in: 300..9999999, message: 'Out of setting range'}
    validates :price, numericality: { message: 'Half-width number'}

end