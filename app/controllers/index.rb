get '/' do
  erb :index
end

get '/users/:user_id/tweets' do
end

get '/users/:user_id/tweets/new' do
end

post '/users/:user_id/tweets' do
  # Tweet.create(params[:tweet])
end

get '/users/:user_id/tweets/:tweet_id' do
end

get '/users/:user_id/tweets/:tweet_id/edit' do
end

put '/users/:user_id/tweets/:tweet_id' do
end

delete '/users/:user_id/tweets/:tweet_id' do
end
