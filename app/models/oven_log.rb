class OvenLog < ActiveRecord::Base
  belongs_to :user

  validates :customer, presence: :true
  validates :work_order, presence: :true
  validates :purchase_order, presence: :true
  validates :operator, presence: :true
  validates_presence_of :stress_asset, :if => :stress_in
  validates_presence_of :her_asset, :if => :her_in
  validates_datetime :her_out, :after => :her_in, :allow_blank => true
  validates_datetime :stress_out, :after => :stress_in, :allow_blank => true

end
