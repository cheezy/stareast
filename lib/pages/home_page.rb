class HomePage
  include PageObject

  divs(:name, :class => 'name')
  buttons(:view_detail, :value => 'View Details')

  def select_puppy(name = 'Brook')
    idx = name_elements.find_index {|div| div.text == name}
    view_detail_elements[idx].click
  end

end