get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"surveys/new"
end

post '/surveys' do
  @survey = Survey.new
  if request.xhr?
    if @survey.save

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
  erb :"surveys/show"
end


