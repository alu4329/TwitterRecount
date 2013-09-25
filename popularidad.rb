require 'rubygems'
require 'twitter'
require 'google_chart'
require './configure'

name = String.new ARGV[0]

# Declaración de array asociativo, soportando cualquier tipo de objeto
user = Hash.new


friends = Twitter.friend_ids(name)

#Bucle/iteración que recorre todos los amigos de un usuario

friends.ids.each do |fid|
  f = Twitter.user(fid)  
  if (f.protected.to_s != "true") # En caso de tener permisos para obtener/acceder a los usuarios...
    user[f.screen_name.to_s] = f.followers_count #contamos sus seguidores
  end
end

#Y lo ordenamos con el sort_by
user.sort_by {|k,v| -v}.each { |user, count| puts "#{user}, #{count}" }
