require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test 'product is not valid without a unique title' do
    product = Product.new(title: products(:ruby).title,
                          description: 'yyy',
                          price: 1)
    assert product.invalid?
    assert_equal ['has already been taken'], product.errors[:title]
  end
end
