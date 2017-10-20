get '/questions/:question_id/choices' do
  @question = Question.find(params[:question_id])
  erb :"/choices/new", layout: false
end

post '/questions/:question_id/choices' do
  ep "wooow"
end
