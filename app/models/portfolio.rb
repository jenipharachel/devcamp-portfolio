class Portfolio < ApplicationRecord
  #maps to technology
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  #validation of data for entry into db
  validates_presence_of :title, :body

  #carrierwave gem provides mount_uploader method
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  #custom scopes -> used for querying data in db
  def self.ruby_on_rails
    where(subtitle: "Ruby on Rails")
  end

  def self.by_position
    order("position ASC")
  end

  scope :react_js, -> {where(subtitle: "React JS")}
end
