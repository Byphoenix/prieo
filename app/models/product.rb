class Product < ActiveRecord::Base
  has_many :line_items
  has_many :properties
  has_many :resources
  has_many :carts, :through => :line_items

  mount_uploader :image_url,ImageUploader

 # before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description,  :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  #validates :image_url, :format => {
  #                        :with=> %r{\.(gif|jpg|png)$}i,
  #                        :message => 'must be a URL for GIF, JPG, or PNG image.'
  #                    }
  def self.salable_items
    Product.all
  end

  private

  #ensure that there are no line items referencing this product
  # def ensure_not_referenced_by_any_line_item
  #   if line_items.empty?
  #     return true
  #   else
  #     errors.add(:base, 'Line Items present')
  #     return false
  #   end
  # end
end
