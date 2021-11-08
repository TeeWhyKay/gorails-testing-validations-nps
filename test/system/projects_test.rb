require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test 'visiting the index' do
    sign_in users(:regular)
    visit projects_url
    assert_selector 'h1', text: 'Projects'
  end

  test 'can create a project' do
    sign_in users(:regular)
    visit projects_url

    click_on 'Add New Project'
    fill_in 'Title', with: 'Hello Test'
    click_on 'Create Project'
    #   assert_text "Project was successfully created"
    assert_selector 'h1', text: 'Hello Test'
  end

  test 'can update a project' do
    sign_in users(:regular)
    visit project_url(@project)

    click_on 'Edit'
    fill_in 'Title', with: 'Hello Test'
    click_on 'Update Project'
    #   assert_text "Project was successfully updated"
    assert_selector 'h1', text: 'Hello Test'
  end

  test 'can destroy a project' do
    sign_in users(:regular)
    visit project_url(@project)

    click_on 'Edit'
    click_on 'Destroy'
    # click_on 'Confirm'

    assert_selector 'h1', text: 'Projects'
    #   page.accept_confirm do
    #     click_on "Destroy", match: :first
    #  end

    #   assert_text "Project was successfully destroyed"
  end
end
