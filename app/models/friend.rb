class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :users, :through => :friendships, dependent: :delete_all

end
