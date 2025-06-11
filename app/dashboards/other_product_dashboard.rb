require "administrate/base_dashboard"

class OtherProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    tipo: Field::String,
    subtipo: Field::String,
    talle_ropa: Field::String,
    talle_zapatilla: Field::String,
    precio: Field::Number.with_options(prefix: "$", decimals: 2),
    distancia: Field::Number.with_options(suffix: "km"),
    condition: Field::Select.with_options(collection: ["Nuevo con etiqueta", "Nuevo sin etiqueta", "Casi nuevo", "Usado"]),
    status: Field::String,
    owner: Field::String,
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
    talle_ropa
    talle_zapatilla
    precio
    distancia
    status
    tags
    condition
    owner
    images
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def permitted_attributes(action = nil)
    super + [images: []]
  end
  def display_resource(product)
    product.title
  end

end
