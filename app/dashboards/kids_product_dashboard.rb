require "administrate/base_dashboard"

class KidsProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    tipo: Field::String,
    subtipo: Field::String,
    edad: Field::Select.with_options(collection: ["","0-1", "2-3", "4-6", "7-9", "10-12", "13+"]),
    talle_ropa: Field::Select.with_options(collection: ["","2", "4", "6", "8", "10", "12", "14"]),
    talle_zapatilla: Field::Select.with_options(collection: ["","20", "22", "24", "26", "28", "30", "32", "34"]),
    precio: Field::Number.with_options(prefix: "$", decimals: 2),  
    subtipo: Field::Select.with_options(collection: ["","Juguete", "Ropa", "Zapatillas", "Libro", "Peluche", "Juegos de mesa", "Accesorio"]),
    condition: Field::Select.with_options(collection: ["","Nuevo con etiqueta", "Nuevo sin etiqueta", "Casi nuevo", "Usado"]),
    distancia: Field::Number.with_options(suffix: "km"),
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
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = %i[
    title
    description
    tipo
    subtipo
    edad
    talle_ropa
    talle_zapatilla
    precio
    condition
    images
    owner
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def permitted_attributes(action = nil)
    super + [images: []]
  end
  def display_resource(product)
    product.title
  end

end
