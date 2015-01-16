after do
  ActiveRecord::Base.clear_active_connections!
end

get '/' do
  erb :index
end

############## MVP #######################################
post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/tweets"
  else
    flash[:error] = "The username and password you entered did not match our records."
    redirect '/login'
  end
end

get '/users/new' do
  erb :"users/new"
end

get '/login' do
  erb :"users/login"
end

post '/users' do
  @user = User.new(username: params[:username])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}/tweets"
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:user_id/tweets' do
  @user = User.find(params[:user_id])
  @leaders = @user.leaders
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
post '/users/:user_id/follow' do
  unless current_user.id == params[:user_id]
    Following.create(follower_id: current_user.id, leader_id: params[:user_id])
  end
  redirect "/users/#{params[:user_id]}/tweets"
end

# get '/users/:user_id/tweets/:tweet_id' do
# end

# get '/users/:user_id/tweets/:tweet_id/edit' do
# end

# put '/users/:user_id/tweets/:tweet_id' do
# end

# delete '/users/:user_id/tweets/:tweet_id' do
# end
