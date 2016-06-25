var ready = function () {
  $(document).on('nested:fieldAdded:creatives', makeExtraCreativesOptional);
  $(document).on('nested:fieldAdded:targetings', unselectTargetingGender);
  $('#ad-form').submit(validate);
};

$(document).ready(ready);
$(document).on('page:change', ready);

/***********************************************
*                Event Handlers                *
************************************************/
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
  if (!validation.ok) {
    showBidError(validation.index);
    event.preventDefault();
    return;
  }

  //event.preventDefault(); // REMOVE
};

/***********************************************
*               DOM Manipulation               *
************************************************/
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

/***********************************************
*              Input Validation                *
************************************************/
var validateBid = function () {
  var valid = true;
  var budget = parseFloat($('#ad_budget').val());

  var elements = $('.ad_creatives_bid');
  var bid, i;
  for (i = 0; i < elements.length && valid; i++) {
    bid = parseFloat($(elements[i]).find('.form-control').val());
    if (bid > budget)
      valid = false;
  }

  return {
    ok: valid,
    index: i-1
  };
};
