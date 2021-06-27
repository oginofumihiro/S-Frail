require 'rails_helper'
RSpec.describe Customer, type: :model do
  it "姓、名、メール、パスワードがある場合、有効である" do
    customer = FactoryBot.build(:customer)
    expect(customer).to be_valid
      end

  it "名がない場合、無効である" do
    customer = FactoryBot.build(:customer, first_name: nil)
    customer.valid?
    expect(customer.errors[:first_name]).to include("を入力してください")
  end

  it "姓がない場合、無効である" do
    customer = FactoryBot.build(:customer, first_name: nil)
    customer.valid?
    expect(customer.errors[:first_name]).to include("を入力してください")
  end

  it "メールアドレスがない場合、無効である"  do
    customer = FactoryBot.build(:customer, email: nil)
    customer.valid?
    expect(customer.errors[:email]).to include("を入力してください")
  end

  it "重複したメールアドレスの場合、無効である" do
    customer1 = FactoryBot.create(:customer)
    customer2 = FactoryBot.build(:customer)
    customer2.valid?
    expect(customer2.errors[:email]).to include("はすでに存在します")
  end

  it "パスワードがない場合、無効である" do
    customer = FactoryBot.build(:customer, password: nil)
    customer.valid?
    expect(customer.errors[:password]).to include("を入力してください")
  end
end