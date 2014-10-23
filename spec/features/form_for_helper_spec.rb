require "rails_helper"

feature "form_for_helper", js: true do
  before do
    visit form_for_helper_path
  end

  it 'renders all of the helpers with ng-model' do
    expect(page).not_to have_content(42)
    click_button "Submit"
    expect(page).to have_content(42)
  end
end
