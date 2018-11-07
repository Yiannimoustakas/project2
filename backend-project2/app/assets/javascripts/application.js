// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require codemirror
//= require jquery
//= require codemirror/modes/javascript

const RunSolution = () => {
  let js = editor.getValue();
  let s = document.createElement('script');
  s.textContent = `funk = val => {
    ${js}
  }`;
  document.body.appendChild(s);
  let correctAnswers = 0;
  let failedInputs = [];
  let totalTests = data.inputs.length;
  try {
    for (var i = 0; i < data.inputs.length; i++) {
      output = funk(data.inputs[i]);
      console.log(`comparing ${output} to ${data.outputs[i]}`);
      console.log(arrayEquality(data.outputs[i], output));
      if (output === data.outputs[i] || (data.outputs[i].constructor === Array && output.constructor === Array && arrayEquality(data.outputs[i], output))) {
        correctAnswers ++;
      }else{
        failedInputs.push(`Input value ${data.inputs[i]} generated the incorrect answer: ${output}`);
      }
    }
    score = Math.round((correctAnswers/data.inputs.length) * 100);
    message = `${correctAnswers} out of ${data.inputs.length} correct. ${score}%`
  }catch (error){
    line = error.stack.split(':')[2];
    line = parseInt(line)-1;
    message = `${error.message}. Best guess: line ${line}`;
  }
  $('.results div').empty();
  $('.results div').text(message);
  $('.results div').append($('<ul>'))
  for (var i = 0; i < failedInputs.length; i++) {
    $('.results div').append($(`<li>${failedInputs[i]}</li>`))
  }
  $('#scorefield').val(score);
  s.remove()
}

const arrayEquality = (arr1, arr2) => {
  if (arr1.length !== arr2.length){
    return false;
  }else{
    for( i = 0; i < arr1.length; i ++){
      if (arr1[i].toString() !== arr2[i].toString()){
        return false;
      }
    }
  }
  return true;
}

const testing = () => {
  console.log("heeeelp");
}
