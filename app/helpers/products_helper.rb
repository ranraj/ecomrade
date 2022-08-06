module ProductsHelper   
    class ProductNotification
        def notify( product)
            puts "#{@product.id} notification triggered"
        end
    end
end
