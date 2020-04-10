class User < ApplicationRecord

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end



  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]         


  has_many :items
  has_many :orders
  has_many :comments
  has_one :profile
  has_one :address
  has_one :credit_card
  has_many :sns_credentials

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/ 
   
  validates :family_name_kana, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX}
  validates :first_name_kana, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX} 
  validates :birth_year, :birth_month, :birth_day, presence: true
  
    

end
