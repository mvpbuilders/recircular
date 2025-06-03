require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    color: Field::String,
    condition: Field::String,
    depth: Field::Number,
    description: Field::Text,
    distancia: Field::Number,
    height: Field::Number,
    images_attachments: Field::HasMany,
    images_blobs: Field::HasMany,
    material: Field::String,
    precio: Field::Number,
    status: Field::String,
    subtipo: Field::String,
    tags: Field::String,
    talle_ropa: Field::String,
    talle_zapatilla: Field::String,
    tipo: Field::String,
    title: Field::String,
    width: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    color
    condition
    depth
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    color
    condition
    depth
    description
    distancia
    height
    images_attachments
    images_blobs
    material
    precio
    status
    subtipo
    tags
    talle_ropa
    talle_zapatilla
    tipo
    title
    width
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    color
    condition
    depth
    description
    distancia
    height
    images_attachments
    images_blobs
    material
    precio
    status
    subtipo
    tags
    talle_ropa
    talle_zapatilla
    tipo
    title
    width
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
