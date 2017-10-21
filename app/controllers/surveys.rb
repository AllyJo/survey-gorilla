get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  authenticate!
  @survey = Survey.new
   erb :"surveys/new"
end

post '/surveys' do
  authenticate!
   @survey = Survey.new(title: params[:title], creator_id: current_user.id)
  if request.xhr?
    if @survey.save
      erb :"/questions/new", layout: false
    else
      status 422
      @survey.errors.full_messages
    end
  else
    if @survey.save
      redirect "/surveys/new"
    else
      @survey.errors.full_messages
    end
  end
end


get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if request.xhr?
    erb :"surveys/show", layout: false
  else
    erb :"surveys/show"
  end
end
