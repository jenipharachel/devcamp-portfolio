class Portfolio < ApplicationRecord
    #validation of data for entry into db
    validates_presence_of :title, :body, :main_image, :thumb_image

    #custom scopes -> used for querying data in db
    def self.ruby_on_rails
        where(subtitle: "Ruby on Rails")
    end

    scope :react_js, -> {where(subtitle: "React JS")}
end
