class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number'}
  end
    validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'Select' }

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    end
end