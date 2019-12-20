require 'rails_helper'

describe "As a visitor on the search page" do
  scenario "I can see the nearest electric fuel station" do
    visit '/'

    click_button 'Find Nearest Station'

    expect(page).to have_content('Seventeenth Street Plaza')
    expect(page).to have_content('1225 17th St.')
    expect(page).to have_content('ELEC')
    expect(page).to have_content('MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
  end
end

# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
