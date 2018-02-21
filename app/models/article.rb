class Article < ActiveRecord::Base
	belongs_to :users
	has_many :commentaires

end