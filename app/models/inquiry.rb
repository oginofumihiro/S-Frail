class Inquiry
  include ActiveModel::Model
  attr_accessor :name, :email, :message

  define_model_callbacks :save
  before_save :form_validation
  validates :name, presence: { message: '名前を入力してください' }
  validates :email, presence: { message: 'メールアドレスを入力してください' }
end
