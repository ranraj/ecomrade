module ProductsHelper
  class ProductNotification
    def notify(_product)
      puts "#{@product.id} notification triggered"
    end
  end
end
