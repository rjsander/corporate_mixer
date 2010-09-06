# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_flash_message(options={})
  html = content_tag(:div, flash.collect{ |name,msg| content_tag(:div, msg, :id => "flash_#{name}") }, :id => 'flash-message')
  if options.key?(:fade)
  html << content_tag(:script, "$(document).ready(function() {
  $(\'#flash-message\').fadeOut(#{options[:fade]*1000}, function() {
  // Animation complete.
  });
  });", :type => 'text/javascript')
  end
  html
  end
end
