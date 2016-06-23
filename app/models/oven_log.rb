class OvenLog < ActiveRecord::Base
  belongs_to :user

  validates :customer, presence: :true
  validates :work_order, presence: :true
  validates :purchase_order, presence: :true
  validates :operator, presence: :true

  validates_presence_of :stress_asset, :if => :stress_in
  validates_presence_of :her_asset, :if => :her_in
  validates_presence_of :stress_in, :stress_out, :her_out, :her_in, :her_asset, :stress_asset, allow_blank: true

  validate :stress_in_must_be_before_stress_out, :if => :stress_in
  validate :her_in_must_be_before_her_out, :if => :her_in



  def stress_in_must_be_before_stress_out
    #if stress_in.present?
      errors.add(:stress_in, "must be before Stress out") unless
      (stress_in < stress_out)
  #  end
  end

  def her_in_must_be_before_her_out
  #  if her_in.present?
      errors.add(:her_in, "must be before HER out") unless
      (her_in < her_out)
  #  end
  end
end
