get '/' do
  erb :index
end

############## MVP #######################################
post '/sessions' do
  @user = User.find_by(params[:username])
  if @user.password == params[:password]
    give_token
  else
    redirect_to home_url
  end
end

get '/users/new' do
  #REGISTRATION FORM
end

post '/users' do
  @user = User.new(params[:username])
  @user.password = params[:password]
  @user.save!
end

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
