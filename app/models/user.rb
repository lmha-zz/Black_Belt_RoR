class User < ActiveRecord::Base
  has_many :friendships, dependent: :delete_all
  has_many :friends, :through => :friendships, dependent: :delete_all
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", dependent: :delete_all
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, format: { with: /[A-Za-z ]/ }

end
