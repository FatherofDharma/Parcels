require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')

get ('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get ('/parcels') do
  @parcels = Parcel.all
  erb(:parcels)
end

get ('/parcels/new') do
  erb(:new_parcel)
end

post ('/parcels') do
  name = params[:parcel_name]
  width = params[:parcel_width]
  height = params[:parcel_height]
  weight = params[:parcel_weight]
  parcel = Parcel.new(name, nil, width, height, weight)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end

get ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

get ('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

patch ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:name])
  @parcels = Parcel.all
  erb(:parcels)
end

delete ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end
