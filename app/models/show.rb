require 'pry'
class Show < ActiveRecord::Base
    has_many :characters
    belongs_to :network

    def actors_list
        self.characters.map do |i|
            i.actor.full_name
        end
    end
end