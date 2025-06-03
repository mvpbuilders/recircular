class UniformProduct < Product
  has_many_attached :images
  default_scope { where(tipo: "uniformes") }

  before_validation :set_tipo

  def set_tipo
    self.tipo = "uniformes"
  end
end
