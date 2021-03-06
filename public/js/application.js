$(document).ready(function() {
  $("#create-survey-form").on("submit", surveyFormHandler);
  $(".main").on("click", ".add-question-input", addQuestionButton);
  $(".main").on("submit", ".question-form",questionFormHandler);
  $(".survey-title a").on("click", showSurveyHandler);
  $(".main").on("click", ".add-choice-input", addChoiceButton);
  $(".main").on("submit", ".choice-form", choiceFormHandler);
  $(".main").on("click", ".show-user-survey-title a", showUserSurvey);
  $(".main").on("click", ".hide-button", hideUserSurvey);
});


var choiceFormHandler = function(){
  event.preventDefault();

  $form = $(this);
  var url = $form.attr("action");
  var method = $form.attr("method");
  var data = $form.serialize();
  var request = $.ajax({
    url: url,
    method: method,
    data: data
  });

  request.done(function(response){
    console.log($form);
    $form.closest(".choice-list").find(".choice-container").append(response);
    $form.remove();
  });
};

var questionFormHandler = function(){
  event.preventDefault();

  $form = $(this);
  var url = $form.attr("action");
  var method = $form.attr("method");
  var data = $form.serialize();
  var request = $.ajax({
    url: url,
    method: method,
    data: data
  });

  request.done(function(response){
    $(".main").append(response);
    $form.remove();
  });
};

var surveyFormHandler = function(){
  event.preventDefault();

  $form = $(this);
  var url = $form.attr("action");
  var method = $form.attr("method");
  var data = $form.serialize();

  var request = $.ajax({
    url: url,
    method: method,
    data: data
  });

  request.done(function(response){
    $(".main").append(response);
    $form.remove();
  });
};

var addQuestionButton = function() {
  event.preventDefault();
  var questionInput = $('.question-input').first().clone().val("");
  $(".question-field").append(questionInput);
};

var showSurveyHandler = function() {
  event.preventDefault();

  console.log("click")

  var $link = $(this);
  var url = $link.attr("href");

  var request = $.ajax({
    url: url
  });

  request.done(function(response){
    $link.siblings('.survey-form').remove('.survey-form')
    $link.closest("li").append(response);
  });
};

var addChoiceButton = function() {
  event.preventDefault();
  console.log("anything");
  var choiceInput = $('.choice-input').first().clone().val("");
  $(this).closest("form").find(".choice-field").append(choiceInput);
};

var showUserSurvey = function(){
  event.preventDefault();

  var $link = $(this);
  var url = $link.attr("href");

  var request = $.ajax({
    url: url
  });

   request.done(function(response){
    $link.siblings('.survey-response').empty();
    $link.closest("li").append(response);
  });
};


var hideUserSurvey = function() {
  event.preventDefault();
    $(this).closest("li").find(".survey-response").remove();
};














