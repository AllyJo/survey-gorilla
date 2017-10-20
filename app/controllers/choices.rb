get '/questions/:question_id/choices' do
  @question = Question.find(params[:question_id])
  erb :"/choices/new", layout: false
end

post '/questions/:question_id/choices' do
  @choices = []
  @errors = []
  params[:choices].each do |body|
    c = Choice.new(body: body, question_id: params[:question_id])
    if c.save
      @choices << c
    else
      @errors << c
    end
  end
  if request.xhr?
    if @choices.length == params[:choices].length
      erb :"/choices/index", layout: false
    else
      status 422
      @errors.map! do |choice|
        choice.errors.full_messages
      end
    end
  else
    ep "not ajax"
  end
end
