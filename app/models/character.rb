require 'pry'
class Character < ActiveRecord::Base
  belongs_to :actor
  belongs_to :show

  def say_that_thing_you_say
    "#{self.name} always says: #{self.catchphrase}"
  end

  def build_show(args = {name: "new_name"})
    show = Show.create(args)
    self.show = show
  end

  def build_network(args = {call_letters: "abc"})
    network = Network.create(args)
    network
  end
end