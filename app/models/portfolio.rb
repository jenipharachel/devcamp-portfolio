class Portfolio < ApplicationRecord
    include Placeholder
    #validation of data for entry into db
    validates_presence_of :title, :body, :main_image, :thumb_image

    #custom scopes -> used for querying data in db
    def self.ruby_on_rails
        where(subtitle: "Ruby on Rails")
    end

    scope :react_js, -> {where(subtitle: "React JS")}

    #data defaults callback
    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
