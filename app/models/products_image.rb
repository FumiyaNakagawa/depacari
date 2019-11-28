class ProductsImage < ApplicationRecord
  mount_uploader :productsimage, ImageUploader
end