class User < ActiveRecord::Base

  has_secure_password
  has_many :articles

  validates :username,
    format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: 'ne doit contenir que des caractères alphanumériques ou des _'},
    uniqueness: {case_sensitive: false}
  validates :email,
    format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
    uniqueness: {case_sensitive: false}
  def to_session
    {id: id}
  end

end