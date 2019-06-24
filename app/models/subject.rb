class Subject < ApplicationRecord

    has_many :pages

    scope :visible, -> {where(:visible => true)}
    scope :invisible, -> {where(:visible => false)}
    scope :sorted, -> {order("position ASC")}
    scope :newest_first, -> {order("created_at DESC")}
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates :name, uniqueness: true

    def slug
        self.name.gsub(/[^0-9a-z ]/i, '').split(" ").join("_").downcase
      end
end