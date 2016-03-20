class User < ActiveRecord::Base
  enum role: [:student, :support, :teacher, :SLT, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
