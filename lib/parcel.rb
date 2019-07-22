require('pry')

class Parcel
  attr_reader :id
  attr_accessor :name, :width, :height, :weight
  @@parcels = {}
  @@total_rows = 0

  def initialize(name, id, width, height, weight)
    @name = name
    @width = width
    @height = height
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.name, self.id, self.width, self.height, self.weight)
  end

  def self.all()
    @@parcels.values()
  end

  def self.find(name)
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(name)
    self.name = name
    @@parcels[self.id] = Parcel.new(self.name, self.id, self.width, self.height, self.weight)
  end

  def delete
    @@parcels.delete(self.id)
  end

end
