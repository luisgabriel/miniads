$(document).ready(function() {
  $(document).on('nested:fieldAdded:creatives', makeExtraCreativesOptional);
  $(document).on('nested:fieldAdded:targetings', unselectTargetingGender);
  $('#ad-form').submit(validate);
});

var makeExtraCreativesOptional = function (event) {
  var inputs = event.field.find('.form-control');
  for (var i = 0; i < inputs.length; i++) {
    inputs[i].classList.remove('required');
    inputs[i].removeAttribute('required');
    inputs[i].removeAttribute('aria-required');
  }

  $(event.target).find('abbr').remove();
};

var unselectTargetingGender = function (event) {
  var inputs = event.field.find('.form-control');
  inputs[inputs.length-1].selectedIndex = 0;
};

var validate = function (event) {
  clearErrors();

  var validation = validateBid();
  console.log(validation)
  if (!validation.ok) {
    showBidError(validation.index);
    event.preventDefault();
    return;
  }

  //console.log('VALID');
  //event.preventDefault(); // REMOVE
};

var clearErrors = function () {
  $('.alert-danger').remove();
  $('.has-error').each(function (index, element) {
    $(element).removeClass('has-error');
  });
  $('.help-block').remove();
};

var errorIndication = function () {
  return $('<div class="alert alert-danger">Please review the problems below:</div>');
}

var errorMessage = function (message) {
  return $('<span class="help-block">' + message + '</span>');
};

var showBidError = function (index) {
  $('#ad-form').prepend(errorIndication);
  var div = $('.ad_creatives_bid')[index];
  $(div).addClass('has-error');
  $(div).find('.col-sm-9')
    .append(errorMessage('This value cannot be bigger than the Ad\'s budget.'));
};

var validateBid = function () {
  var valid = true;
  var budget = $('#ad_budget').val();

  var elements = $('.ad_creatives_bid');
  var e, i;
  for (i = 0; i < elements.length && valid; i++) {
    e = $(elements[i]).find('.form-control');
    if (e.val() > budget)
      valid = false;
  }

  return {
    ok: valid,
    index: i-1
  };
};
