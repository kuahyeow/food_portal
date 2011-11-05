module ApplicationHelper
  def tactile_image(name, options={})
    image_name = if name =~ /beer/i
      'beer.jpg'
    elsif name =~ /canned/i
      'canned.jpg'
    elsif name =~ /(salmon|fish)/i
      'salmon.jpg'
    elsif name =~ /(vege|tomato)/i
      'tomato.jpg'
    else
      'beer.jpg'
    end
    image_tag image_name, options
  end

  def price(name)
    session[:prices][name] ||= rand(10) + rand(1) + rand(0.5)
  end
end
