get '/' do
  erb :index
end

############## MVP #######################################
get '/users/:user_id/tweets' do
  erb :'tweets/show'
end

get '/users/:user_id/tweets/new' do
  @user = User.find(params[:user_id])
  erb :'tweets/new'
end

post '/users/:user_id/tweets' do
  # Tweet.create(params[:tweet].merge(user_id: params[:user_id]))
  @user = User.find(params[:user_id])
  @tweet = Tweet.create(params[:tweet])
  @tweet.user = @user
  @tweet.save
  redirect "/users/#{@user.id}/tweets"
end

  #user = User.find(params[:user_id])
  #Tweet.create(content: params[:tweet][:content], user_id: user.id)

##########################################################
# get '/users/:user_id/tweets/:tweet_id' do
# end

# get '/users/:user_id/tweets/:tweet_id/edit' do
# end

# put '/users/:user_id/tweets/:tweet_id' do
# end

# delete '/users/:user_id/tweets/:tweet_id' do
# end
