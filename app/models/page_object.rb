class PageObject < ActiveRecord::Base
  include ThriveSmartObjectMethods
  self.caching_default = :any_page_update #[in :forever, :page_update, :any_page_update, 'data_update[datetimes]', :never, 'interval[5]']

  belongs_to :footer
  
  attr_protected :footer_id
  # validates_presence_of :footer_id  -- Interferes with the code below, when footer is a new object
  
  # Pass the buck and actually save the footer
  after_update :save_footer
  
  # Creates a new footer if it doesn't exist for the sent in organization
  def self.new_by_organization_uid(organization_uid, attr_hash)
    footer = Footer.find_by_organization_uid(organization_uid)
    if footer.nil?
      footer = Footer.new
      footer.organization_uid = organization_uid
    end
    new(attr_hash.merge({:footer => footer}))
  end
  
  def validate
    unless footer.valid?
      errors.add(:footer, " has an error that must be corrected.")
    end
  end
  
  # Passes the buck of the hash passed in to the actual footer model
  def assigned_footer=(hash)
    self.footer.attributes = hash
  end
  
  protected
    def save_footer
      footer.save
    end
end
