require "administrate/base_dashboard"

class ClothingProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    tipo: Field::String,
    subtipo: Field::Select.with_options(collection: ["",
      "Pantalones y joggers",
      "Leggings y bikers",
      "Jeans",
      "Remeras y tops",
      "Sweaters y buzos",
      "Bikinis y enteros",
      "Abrigos",
      "Camisas",
      "Shorts y faldas",
      "Vestidos y monos"
    ]),
    condition: Field::Select.with_options(collection: ["","Nuevo con etiqueta", "Nuevo sin etiqueta", "Casi nuevo", "Usado"]),
    color: Field::Select.with_options(collection: ["",
      "Negro", "Gris", "Blanco", "Marrón", "Naranja", "Crudo", "Amarillo", "Rojo",
      "Rosa", "Violeta", "Celeste", "Azul", "Verde", "Verde oscuro", "Khaki", "Multicolor",
      "Dorado", "Plateado"
    ]),
    talle_ropa: Field::Select.with_options(collection: ["","XS", "S", "M", "L", "XL", "XXL"]),
    talle_zapatilla: Field::Select.with_options(collection: ["","35", "36", "37", "38", "39", "40", "41", "42", "43"]),
    precio: Field::Number.with_options(prefix: "$", decimals: 2),
    distancia: Field::Number.with_options(suffix: "km"),
    genero: Field::Select.with_options(collection: ["","Hombre", "Mujer", "Unisex"]),
    status: Field::String,
    owner: Field::String,
    uso: Field::Select.with_options(collection: ["","Nuevo con etiqueta", "Nuevo sin etiqueta", "Casi nuevo", "Usado"]),
    tags: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    tipo
    precio
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = %i[
    title
    description
    tipo
    subtipo
    condition
    color
    talle_ropa
    talle_zapatilla
    precio
    genero
    owner   
    images
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def permitted_attributes(action = nil)
    super + [images: []]
  end
  def display_resource(product)
    product.title || "Producto ##{product.id}"
  end


end
