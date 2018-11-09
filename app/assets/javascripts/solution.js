let editor;
let data;
let errors;
let score;

const RunSolution = () => {
  let js = editor.getValue();
  let correctAnswers = 0;
  let outputs = [];
  let totalTests = data.inputs.length;
  let s = document.createElement('script');
  s.textContent = `
    funk = function(input){
      ${js}
      return output;
    }`
  document.body.appendChild(s);
  try {
    for (var i = 0; i < data.inputs.length; i++) {
      output = funk(data.inputs[i]);
      if (output === data.outputs[i] || (data.outputs[i].constructor === Array && output.constructor === Array && arrayEquality(data.outputs[i], output))) {
        outputs.push(`Input <strong>${data.inputs[i]}</strong> succeeded with: <strong>${output}</strong>`);
        correctAnswers ++;
      }else{
        outputs.push(`Input <strong>${data.inputs[i]}</strong> generated the incorrect answer: <strong>${output}</strong>`);
      }
    }
    score = Math.round((correctAnswers/data.inputs.length) * 100);
    message = `${correctAnswers} out of ${data.inputs.length} correct. ${score}%`
  }catch (error){
    score = 0;
    if (error.message === "funk is not defined"){
      message = "Function definiton failed. Most likely lacking brackets somewhere."
    }else{
      line = error.stack.split(':')[2];
      line = parseInt(line)-2;
      message = `${error.message}. Best guess: line ${line}`;
    }
  }
  $('.results div').empty();
  $('.results div').text(message);
  $('.results div').append($('<ul>'))
  for (var i = 0; i < outputs.length; i++) {
    $('.results div').append($(`<li>${outputs[i]}</li>`))
  }
  $('#scorefield').val(score);
  s.remove()
  delete funk;
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

const convertForm = () => {
  let myTextArea = $('#definitionArea')[0];
  editor = CodeMirror.fromTextArea( myTextArea, {
    value: myTextArea.value,
    theme: 'liquibyte',
    lineNumbers: false,
    readOnly: true,
  });
  myTextArea = $('#returnArea')[0];
  editor = CodeMirror.fromTextArea( myTextArea, {
    value: myTextArea.value,
    theme: 'liquibyte',
    lineNumbers: false,
    readOnly: true,
  });
  myTextArea = $('.codearea')[0];
  editor = CodeMirror.fromTextArea( myTextArea, {
    value: myTextArea.value,
    theme: 'liquibyte',
    lineNumbers: true,
  });
}
