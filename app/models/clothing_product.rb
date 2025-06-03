class ClothingProduct < Product
  has_many_attached :images
  default_scope { where(tipo: "ropa") }

  before_validation :set_tipo
  def set_tipo
    self.tipo = "ropa"
  end
end
