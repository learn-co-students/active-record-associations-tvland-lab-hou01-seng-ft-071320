class Show < ActiveRecord::Base
  belongs_to :actor
  belongs_to :network
  has_many :characters

  has_many :actors, through: :characters

    def actors_list
      Character.all.select{|character|character.show_id = self.id}
      .map{|character| Actor.find_by(id: character.actor_id)}
      .map{|actor| actor.full_name}
    end
end