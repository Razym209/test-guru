class User < ApplicationRecord
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  
  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users
 
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end

