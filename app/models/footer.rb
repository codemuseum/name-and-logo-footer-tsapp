class Footer < ActiveRecord::Base
  has_many :page_objects
  
  attr_protected :organization_uid
  validates_uniqueness_of :organization_uid
  validates_presence_of :organization_uid
  validates_inclusion_of :layout, :in => %w(left hidden)
  
  before_validation :set_default_layout
  
  def layout_hidden?
    self.layout == 'hidden'
  end
  
  def picture?
    @picture || ( !self.asset_urn.blank? && !self.asset_type.blank? )
  end
  
  def picture_url
    @picture_url ||= "#{ThriveSmart::Constants.ts_platform_host}/#{asset_type.downcase.pluralize}/#{asset_urn}.img"
  end
  
  def after_initialize
    if new_record?
      self.layout = 'left'
      self.phone = 'Main Phone Number'
      self.url = 'www.mysite.com'
    end
  end
  
  protected
  
  def set_default_layout
    self.layout = 'left' if self.layout.blank?
  end
end
