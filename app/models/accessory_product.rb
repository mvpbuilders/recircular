# app/models/accessory_product.rb
class AccessoryProduct < Product
  has_many_attached :images

  default_scope { where(tipo: "accesorios") }

  before_validation :set_tipo
  def set_tipo
    self.tipo = "accesorios"
  end
end
