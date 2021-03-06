class CsvFile < ApplicationRecord
  SUPPLIER_FILE = 'suppliers.csv'
  SKU_FILE = 'sku.csv'

  has_attached_file :attachment, attachment_presence: true
  validates_attachment :attachment,
    content_type: { content_type: 'text/plain' },
    file_name: { matches: [/#{SUPPLIER_FILE}/, /#{SKU_FILE}/] }

  enum status: { active: 0, processed: 1 }

  scope :active, -> { where(status: 0) }
end
