module ApplicationHelper
  def tactile_image(name)
    if name =~ /beer/i
      image_tag('beer.jpg')
    elsif name =~ /fish/i
      image_tag('salmon.jpg')
    elsif name =~ /vege/i
      image_tag('tomato.jpg')
    else
      image_tag('beer.jpg')
    end
  end
end
