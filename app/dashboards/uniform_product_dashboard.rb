require "administrate/base_dashboard"

class UniformProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    tipo: Field::String,
    subtipo: Field::String,
    colegio: Field::Select.with_options(collection: ["San Andrés", "St. Catherine's", "Lincoln", "Northlands", "Tarbut", "Michael Ham", "Polo", "Belgrano Day", "Bilingüe", "Nuevo de las Lomas"]),
    talle_ropa: Field::Select.with_options(collection: ["XS", "S", "M", "L", "XL"]),
    precio: Field::Number.with_options(prefix: "$", decimals: 2),
    distancia: Field::Number.with_options(suffix: "km"),
    status: Field::String,
    tags: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    colegio
    precio
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = %i[
    title
    description
    tipo
    subtipo
    colegio
    talle_ropa
    precio
    distancia
    status
    tags
    owner
    images
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def permitted_attributes(action = nil)
    super + [images: []]
  end
end
