class Actor < ActiveRecord::Base
  belongs_to :show
  has_many :characters

  has_many :shows, through: :characters

    def full_name
        self.first_name + " " + self.last_name
    end

    def list_roles
      self_character = Character.all.select{|character|character.actor_id = self.id}
      self_shows = self_character.map{|character| Show.find_by(id: character.show_id)}

      self_character.each_with_object([]) do |character,roles|
        self_shows.each do |show|
          roles << character.name + " - " + show.name
        end
      end
    end
end