class Image < ApplicationRecord
  has_one_attached :image

  # Validations

  # Validate the labels are not empty
  validates :tittle, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 100 }
  validate :image_type
  validate :image_size

  # Validate only image formats (JPG, JPEG, PNG, GIF) are allowed
  def image_type
    allowed_formats = %w[image/jpeg, image/png, image/jpg, image/gif]
    if image.attached? && allowed_formats.include?(image.content_type)
      errors.add(:image, "Invalid format type. Allowed formats: JPEG, PNG, JPG and GIF.")
    elsif image.attached? == false
      errors.add(:image, "has not been uploaded.")
    end
  end

  # Validate the Maximum size from the image must be be 3 Megabytes
  def image_size
    if image.attached? && image.blob.byte_size > 3.megabytes
      errors.add(:image, "debe ser menor a 3MB.") end
  end
end
