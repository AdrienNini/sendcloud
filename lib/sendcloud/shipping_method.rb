module Sendcloud
  class ShippingMethodException < StandardError; end

  class ShippingMethod < Base
    def list
      response = self.class.get("/shipping_methods", :basic_auth => auth)
      response["shipping_methods"]
    end

    def get(shipping_id)
      response = self.class.get("/shipping_methods/#{shipping_id}", :basic_auth => auth)
      if response["error"]
        raise ShippingMethodException.new(response["error"]["message"])
      end
      response["shipping_method"]
    end
  end
end
