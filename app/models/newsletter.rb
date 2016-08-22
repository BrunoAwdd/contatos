class Newsletter < ActiveRecord::Base
  has_and_belongs_to_many :products

  def status_text
    I18n.t(status.to_s, :scope => 'newsletters.model.status')
  end
end
