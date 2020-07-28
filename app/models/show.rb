class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    actors = self.characters.map do |c|
      "#{c.actor.first_name} #{c.actor.last_name}"
    end
    actors
  end


end
