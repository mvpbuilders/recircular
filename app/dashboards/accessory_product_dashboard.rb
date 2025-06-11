require "administrate/base_dashboard"

class AccessoryProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::ActiveStorage,
    title: Field::String,
    description: Field::Text,
    tipo: Field::String,
    subtipo: Field::Select.with_options(collection: ["",
      "collar", "pulsera", "anillo", "aros", "reloj", "vincha", "lentes","cartera", "bufanda", "cinturón"
    ]),
    uso: Field::Select.with_options(collection: ["","nuevo", "usado", "casi nuevo"]),
    color: Field::String,
    precio: Field::Number,
    status: Field::String,
    tags: Field::String,
    owner: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  FORM_ATTRIBUTES = %i[
    title
    description
    tipo
    subtipo
    uso
    color
    precio
    status
    tags
    owner
    images
  ].freeze

  COLLECTION_ATTRIBUTES = %i[
    title
    subtipo
    precio
    owner
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  COLLECTION_FILTERS = {}.freeze

  def permitted_attributes(action = nil)
    super + [images: []]
  end
  def display_resource(product)
    product.title
  end

end
