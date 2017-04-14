/*

Use: Add input toggles such as:

    <form>
      <input type="submit" onclick="switch_style('dark');return false;" 
             name="theme" value="dark" id="dark" class="btn btn-mini pull-right"> 
      <input type="submit" onclick="switch_style('light');return false;" 
             name="theme" value="light" id="light" class="btn btn-mini pull-right">
    </form>

into the relevant html. Also be sure to include the javascript in the header so that css changes automatically first. 

    <script type="text/javascript" src="{{ site.url }}/assets/js/switch-css.js"></script>
    <script type="text/javascript"> set_style_from_cookie(); </script> 
*/


var style_cookie_name = "style" ;
var style_cookie_duration = 30 ;

function set_cookie ( cookie_name, cookie_value,
    lifespan_in_days, valid_domain )
{
    // http://www.thesitewizard.com/javascripts/cookies.shtml
    var domain_string = valid_domain ?
                       ("; domain=" + valid_domain) : '' ;
    document.cookie = cookie_name +
                       "=" + encodeURIComponent( cookie_value ) +
                       "; max-age=" + 60 * 60 *
                       24 * lifespan_in_days +
                       "; path=/" + domain_string ;
}

function get_cookie(c_name)
{
  var i,x,y,ARRcookies=document.cookie.split(";");
  for (i=0;i<ARRcookies.length;i++)
  {
    x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
    y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
    x=x.replace(/^\s+|\s+$/g,"");
    if (x==c_name)
      {
      return unescape(y);
      }
    }
}


function switch_style ( css_title )
{
// You may use this script on your site free of charge provided
// you do not remove this notice or the URL below. Script from
// http://www.thesitewizard.com/javascripts/change-style-sheets.shtml
  var i, link_tag ;
  for (i = 0, link_tag = document.getElementsByTagName("link") ;
    i < link_tag.length ; i++ ) {
    if ((link_tag[i].rel.indexOf( "stylesheet" ) != -1) &&
      link_tag[i].title) {
      link_tag[i].disabled = true ;
      if (link_tag[i].title == css_title) {
        link_tag[i].disabled = false ;
      }
    }
    set_cookie( style_cookie_name, css_title,
      style_cookie_duration );
  }
}


function set_style_from_cookie()
{
  var css_title = get_cookie( style_cookie_name );
  if (css_title.length > 0) {
    switch_style(css_title);
  }
}

function load()
{
  alert("Page is loaded");
}
