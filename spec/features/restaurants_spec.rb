require 'rails_helper'

feature 'stuff on restaurants page'

  scenario 'user navigates through the page'

    visit restaurants_path
    click_on "Mexican"
    

  end

end
