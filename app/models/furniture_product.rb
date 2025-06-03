class FurnitureProduct < Product
  has_many_attached :images
  default_scope { where(tipo: "muebles") }

  before_validation :set_tipo
  def set_tipo
    self.tipo = "muebles"
  end
end