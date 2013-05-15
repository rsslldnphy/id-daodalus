require 'spec_helper'

class Cat
  include Daodalus::Model

  field :name

  def self.for_name(name)
    new dao.where(:name).eq(name).find_one
  end

end

class Dog
  include Daodalus::Model

  field :name
end

describe Daodalus::Model do

  let (:cat) { Cat.new(name: "Henrietta") }
  let (:dog) { Dog.new(name: "Geoffrey") }

  it 'creates a DAO for the model' do
    cat.dao.should be_a Daodalus::DAO
  end

  it 'creates a different DAO for each model' do
    cat.dao.should_not eq dog.dao
  end

  it 'can save cats' do
    cat.save
  end

  it 'can get cats by name' do
    Cat.remove_all
    saved_cat = cat.save
    Cat.for_name('Henrietta').should eq saved_cat
  end

end
