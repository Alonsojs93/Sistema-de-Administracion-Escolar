class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :grupo, :foreign_key => :alumno_id
  has_many :grupo, :foreign_key => :profesor_id
  has_many :alumno, :class_name => 'user', :through => :grupo
  has_many :profesor, :class_name => 'user', :through => :grupo
  def nombre_completo
    "#{apPaterno} #{apMaterno} #{nombre}"
  end
  validates :nombre, presence: true
  validates :apPaterno, presence: true
  validates :rol, inclusion: {in: ["profesor","alumno","administrador"]}, presence: true  
end
