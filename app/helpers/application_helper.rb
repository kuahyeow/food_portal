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
end
