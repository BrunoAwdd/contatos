class Contato < ActiveRecord::Base

  has_many :emails, inverse_of: :contato, dependent: :destroy
  accepts_nested_attributes_for :emails,
                                reject_if: proc { |attributes| attributes['email'].blank? },
                                :allow_destroy => true

  def full_name
    first_name.blank? ? f_name = '' : f_name = first_name
    last_name.blank? ? l_name = '' : l_name = last_name
    f_name + ' ' + l_name
  end

end
