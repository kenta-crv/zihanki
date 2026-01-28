// Place all the styles related to the estimates controller here.
// They will automatically be included in application.css.
// You can use Sass (SCSS) here: http://sass-lang.com/

$ ->
  $("#estimate_postcode").jpostal({
    postcode : [ "#estimate_postcode" ],
    address  : {
                  "#estimate_prefecture_code" : "%3",
                  "#estimate_address_city"            : "%4",
                  "#estimate_address_street"          : "%5%6%7"
                }
  })