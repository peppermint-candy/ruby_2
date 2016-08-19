class User < ActiveRecord::Base
  has_secure_password

  has_many :networks
  has_many :connects, :through => :networks
  #
  # has_and_belongs_to_many :connects,
  #   :class_name => "User",
  #   :join_table => "networks",
  #   :association_foreign_key => "connect_id"

  has_and_belongs_to_many :connects_to,
    :class_name => "User",
    :join_table => "networks",
    :foreign_key => "connect_id",
    :association_foreign_key => "user_id"




  validates :name, :description , :password , presence:true

  validates :password, length: { minimum: 8 }, confirmation: true

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
end
