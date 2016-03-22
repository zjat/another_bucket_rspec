class TestProduct < ActiveRecord::Base

  def self.by_name
    order(:name)
  end

  def self.by_price(desc = false)
    if desc
      order(price: :desc)
    else
      order(:price)
    end
  end

  def self.by_quantity
    order(:quantity)
  end

  # def all_info
  #   { name: self.name, price: self.price, quantity: self.quantity }
  # end

  def advertisement
    "Buy now for best savings!"
  end

  def warning
    "These products are not FDA approved."
  end
end
