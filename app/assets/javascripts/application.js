
//= require rails-ujs
//= require activestorage
//= require_tree .



const RunSolution = () => {
  let js = editor.getValue();
  let correctAnswers = 0;
  let failedInputs = [];
  let s;
  let totalTests = data.inputs.length;
  try {
    s = document.createElement('script');
    s.textContent = `funk = input => {
      ${js}
      return output;
    }`;
    document.body.appendChild(s);
    for (var i = 0; i < data.inputs.length; i++) {
      output = funk(data.inputs[i]);
      console.log(`comparing ${output} to ${data.outputs[i]}`);
      console.log(arrayEquality(data.outputs[i], output));
      if (output === data.outputs[i] || (data.outputs[i].constructor === Array && output.constructor === Array && arrayEquality(data.outputs[i], output))) {
        correctAnswers ++;
      }else{
        failedInputs.push(`Input "${data.inputs[i]}" generated the incorrect answer: "${output}"`);
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