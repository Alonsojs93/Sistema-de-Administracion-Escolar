class Asignatura < ActiveRecord::Base
    has_many :grupo
    validates :nombre, presence: { message: ": Es necesario un nombre para continuar" }
end
