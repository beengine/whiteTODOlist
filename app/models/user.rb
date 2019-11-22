class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects

  def generate_client_id
  	'tgdfgsf'
  end

  def generate_client_request_id
  	'dfgsdfgsdg'
  end
end
