class Producto < ApplicationRecord
  validates :nombre, presence: true
  validates :precio, presence: true, numericality: { greater_than: 0 }

  before_save :crear_registro_de_auditoria

  private

  def crear_registro_de_auditoria
    # Lógica para crear un registro de auditoría
  end
  
end

