class Grupo < ActiveRecord::Base

    belongs_to :user, :foreign_key => :alumno_id
    belongs_to :profesor, :class_name => 'user', :foreign_key => :profesor_id
    belongs_to :asignatura
    validates :alumno_id, presence: true
    validates :profesor_id , presence: true
    validates :asignatura_id, presence: true
    validates :grupo, presence: { message: "Es necesario un grupo para continuar" } 
    validates :alumno_id, uniqueness: { scope: [:profesor_id, :asignatura_id], message: "Ya existe registro de este alumno"}
    validates :calificacion, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10, message: ": debe ser entre un número entre 0 y 10" }

end
