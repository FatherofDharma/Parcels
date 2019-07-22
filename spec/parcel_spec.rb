require('rspec')
require('parcel')

describe('#Parcel') do

  it ('will initialize a new Parcel and store a name and weight') do
    package = Parcel.new('Daniel', 2, 2, 2)
    expect(package.name).to(eq('Daniel'))
    expect(package.width).to(eq(2))
    expect(package.height).to(eq(2))
    expect(package.weight).to(eq(2))
  end

end
