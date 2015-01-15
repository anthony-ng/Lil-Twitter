get '/' do
  erb :index
end

############## MVP #######################################
get '/users/:user_id/tweets' do
  erb :show
end

get '/users/:user_id/tweets/new' do
  erb :new
end

post '/users/:user_id/tweets' do
  # Tweet.create(params[:tweet])
end

##########################################################
# get '/users/:user_id/tweets/:tweet_id' do
# end

# get '/users/:user_id/tweets/:tweet_id/edit' do
# end

# put '/users/:user_id/tweets/:tweet_id' do
# end

# delete '/users/:user_id/tweets/:tweet_id' do
# end
