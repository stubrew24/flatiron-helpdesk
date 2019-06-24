class Section < ApplicationRecord

    belongs_to :page, { :optional => true }
    has_many :section_edits
    has_many :admin_users, through: :section_edits

    scope :visible, -> {where(:visible => true)}
    scope :invisible, -> {where(:visible => false)}
    scope :sorted, -> {order("position ASC")}
    scope :newest_first, -> {order("created_at DESC")}
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

    CONTENT_TYPES = ['text', 'HTML']
  
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_presence_of :content

    def slug
      self.name.gsub(/[^0-9a-z ]/i, '').split(" ").join("_").downcase
    end

end
