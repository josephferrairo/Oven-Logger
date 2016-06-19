class OvenLog < ActiveRecord::Base
  belongs_to :user

  validates :customer, presence: :true
  validates :work_order, presence: :true
  validates :purchase_order, presence: :true
  validates :operator, presence: :true
  
end
