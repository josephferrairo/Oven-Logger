require 'rails_helper'

RSpec.feature "Create Oven Log" do
  scenario "with valid inputs succeeds" do
    user = Fabricate(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link "New Log"
    fill_in "Customer", with: "Customer ABC"
    fill_in "Work Order", with: "87654321"
    fill_in "Purchase Order", with: "123456"
    fill_in "Operator", with: "JF"
    fill_in "Stress in", with: Faker::Time.backward(14, :evening)
    fill_in "Stress out", with: Faker::Time.forward(14, :evening)
    fill_in "Stress Asset", with: "ov-1"
    fill_in "HER in", with: Faker::Time.backward(14, :evening)
    fill_in "HER out", with: Faker::Time.forward(14, :evening)
    fill_in "HER Asset", with: "ov-2"

    click_button "Submit"

    expect(page).to have_content('New log created!')
  end
end
