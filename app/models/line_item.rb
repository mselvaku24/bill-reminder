class LineItem < ActiveRecord::Base
  belongs_to :company
  belongs_to :cart
end
