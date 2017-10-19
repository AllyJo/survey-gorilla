get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"/surveys/new"
end

post '/surveys' do
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
# survey
  # question
    # choice 1
    # choice 2
    # choice 3



