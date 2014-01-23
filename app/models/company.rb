class Company < ActiveRecord::Base
  default_scope :order => 'name'

  validates :name, :description, :presence => true;
  validates :name, :uniqueness => true;

  has_many :line_items

  before_destroy :ensure_not_reference_by_any_line_item

  private
  def ensure_not_reference_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line items present')
      return false
    end
  end


end
