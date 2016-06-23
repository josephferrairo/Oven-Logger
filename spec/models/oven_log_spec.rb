require 'rails_helper'

RSpec.describe OvenLog, type: :model do
  it {should belong_to(:user) }

  it { should validate_presence_of(:customer) }
  it { should validate_presence_of(:work_order) }
  it { should validate_presence_of(:purchase_order) }
  it { should validate_presence_of(:operator) }


#  context "if Stress in" do
#    before { allow(subject).to receive(:stress_in).and_return(true) }
#    it { should validate_presence_of(:stress_asset) }
#  end




  #context "if HER in" do
  #  if (:her_in).present?
  #    before { allow(subject).to receive(:her_in).and_return(true) }
  #    it { should validate_presence_of(:her_asset) }
  #  end
  #end


end
