$(document).ready(function() {
  $(document).on('nested:fieldAdded:creatives', makeExtraCreativesOptional);
  $('#ad-form').submit(validate);
});

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
  $('.has-error').each(function (index, element) {
    $(element).removeClass('has-error');
  });
  $('.help-block').remove();
};

var errorBlock = function (message) {
  return $('<span class=\'help-block\'>' + message + '</span>');
};

var showBidError = function (index) {
  var div = $('.ad_creatives_bid')[index];
  $(div).addClass('has-error');
  $(div).find('.col-sm-9')
    .append(errorBlock('This value cannot be bigger than the Ad\'s budget.'));
};

var makeExtraCreativesOptional = function (event) {
  var inputs = event.field.find('.form-control');
  for (var i = 0; i < inputs.length; i++) {
    inputs[i].classList.remove('required');
    inputs[i].removeAttribute('required');
    inputs[i].removeAttribute('aria-required');
  }

  $(event.target).find('abbr').remove();
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
