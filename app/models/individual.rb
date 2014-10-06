class Individual < ActiveRecord::Base
  has_one :funding
  has_one :business
end
