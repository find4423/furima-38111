class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/u, allow_blank: true} 
    validates :last_name , presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/u, allow_blank: true}
    validates :first_name_kana , presence: true, format: { with: /\A[ァ-ヶー]+\z/u, allow_blank: true}
    validates :last_name_kana , presence: true, format: { with: /\A[ァ-ヶー]+\z/u, allow_blank: true}
    # validates :password, length:{minimum:6}, allow_blank: true デフォでかかったやがったこいつ...何の時間やったんや...
    validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}, allow_blank: true

end


