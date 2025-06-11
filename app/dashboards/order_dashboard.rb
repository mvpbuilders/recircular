class OrderDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    order_items: Field::HasMany,
    email: Field::String,
    telefono: Field::String,
    total_amount: Field::Number.with_options(prefix: "$", decimals: 2),
    status: Field::String,
    direccion: Field::String,
    envio: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    email
    direccion
    telefono
    total_amount
    order_items
    status
  ].freeze


  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  FORM_ATTRIBUTES = [] # no se edita desde admin

  COLLECTION_FILTERS = {}.freeze
end
