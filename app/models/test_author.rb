class TestAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :test
  #ЕСЛИ АВТОРОВ НЕСКОЛЬКО
end
