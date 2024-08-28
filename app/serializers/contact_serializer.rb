class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end
  has_many :phones
  has_one :address

  meta do
    { author: "Uriel Juliatti" }
  end

  def attributes(*args)
    h = super(*args)
    # pt-BR: h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
