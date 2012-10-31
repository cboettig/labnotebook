module TextFilter
  def codecogs(input)
  desired = input.gsub(/\\\[\s*(.*?)\s*\\\]/, "<div style=\"text-align:center;\"><img src=\"http://latex.codecogs.com/png.latex?\\1\" alt=\"\\1\" /></div>") 
  desired.gsub(/\\\(\s*(.*?)\s*\\\)/, "<img src=\"http://latex.codecogs.com/png.latex?\\1\\inline\"/>")
  end
end
Liquid::Template.register_filter(TextFilter)
