class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network
  
  def actors_list
    list=[]
    list.push(Character.all.find_by(actor:self).actor.full_name)
    list
  end
  
  def build_network(m)
    newnetwork=Network.create(m)
    self.network=newnetwork
  end
    
end