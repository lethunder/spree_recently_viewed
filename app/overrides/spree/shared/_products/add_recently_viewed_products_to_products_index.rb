Deface::Override.new(
  virtual_path: 'spree/shared/_products',
  name: 'add_recently_viewed_products_to_products_index',
  insert_bottom: "#content",
  partial: 'spree/shared/add_recently_viewed_products'
)
