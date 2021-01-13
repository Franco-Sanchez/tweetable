class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+\.\w{2,3}\z/,
                              message: 'It must be in a valid format: example@example.com' }
  validates :name, presence: true
  # I use allow_blank, to be able to edit a user without changing the password.
  validates :password, length: { minimum: 6 }, allow_blank: true
end
