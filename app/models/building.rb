class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

end
