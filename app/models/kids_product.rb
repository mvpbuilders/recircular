class KidsProduct < Product
  has_many_attached :images
  default_scope { where(tipo: "niños") }

  before_validation :set_tipo

  def set_tipo
    self.tipo = "niños"
  end
end
