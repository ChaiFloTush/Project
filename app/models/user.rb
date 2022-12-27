class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :articles, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates_uniqueness_of :name
end
