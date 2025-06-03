require "administrate/base_dashboard"

class FurnitureProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    tipo: Field::String.with_options(default: "muebles/deco"),
    subtipo: Field::Select.with_options(collection: ["",
      "sillón", "mesa", "silla", "barra", "placard", "biblioteca",
      "cuadro", "almohadón", "lámpara", "espejo", "puff", "velador",
      "cómoda", "perchero", "repisa", "estantería", "baúl", "taburete"
    ]),
    condition: Field::Select.with_options(collection: ["","Nuevo con etiqueta", "Nuevo sin etiqueta", "Casi nuevo", "Usado"]),
    material: Field::Select.with_options(collection: ["","madera", "metal", "plástico", "vidrio", "cuero", "tapizado"]),
    color: Field::Select.with_options(collection: ["",
      "Negro", "Gris", "Blanco", "Marrón", "Naranja", "Crudo", "Amarillo", "Rojo",
      "Rosa", "Violeta", "Celeste", "Azul", "Verde", "Verde oscuro", "Khaki", "Multicolor",
      "Dorado", "Plateado"
    ]),
    precio: Field::Number.with_options(prefix: "$", decimals: 2),
    distancia: Field::Number.with_options(suffix: "km"),
    width: Field::Number.with_options(suffix: "cm"),
    height: Field::Number.with_options(suffix: "cm"),
    depth: Field::Number.with_options(suffix: "cm"),
    uso: Field::Select.with_options(collection: ["","Nuevo con etiqueta", "Nuevo sin etiqueta", "Casi nuevo", "Usado"]),
    status: Field::String,
    tags: Field::String,
    owner: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    tipo
    precio
    owner
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = %i[
    title
    description
    tipo
    subtipo
    condition
    material
    color
    precio
    width
    height
    depth
    owner
    images
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def permitted_attributes(action = nil)
    super + [images: []]
  end
end
