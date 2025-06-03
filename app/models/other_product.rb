class OtherProduct < Product
  has_many_attached :images
  default_scope { where(tipo: "otros") }

  before_validation :set_tipo

  def set_tipo
    self.tipo = "otros"
  end
end
