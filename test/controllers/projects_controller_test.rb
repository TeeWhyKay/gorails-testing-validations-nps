require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:regular)
    @project = projects(:one)
  end

  test 'redirected if not logged in' do
    sign_out :user
    get projects_url
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'Log in'
  end

  test 'can get index if logged in' do
    get projects_url
    assert_response :success
  end

  test 'can get new' do
    get projects_url
    assert_response :success
  end

  test 'can create a project' do
    # gets count before and after the block and compares the difference
    assert_difference('Project.count') do
      post projects_url, params: { project: { title: 'Test Project' } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test 'cannot create project with invalid attributes' do
    assert_no_difference('Project.count') do
      post projects_url, params: { project: { title: '' } }
    end
  end

  test 'can view project' do
    get project_url(@project)
    assert_response :success
  end

  test 'can edit project' do
    get edit_project_url(@project)
    assert_response :success
  end

  test 'can update project' do
    patch project_url(@project), params: { project: { title: 'Updated Project' } }
    assert_redirected_to project_url(@project)
    @project.reload
    assert_equal 'Updated Project', @project.title
  end

  test 'cannot update project with invalid attribute' do
    patch project_url(@project), params: { project: { title: '' } }
    # when update and create fails it returns the form with 200 due to render
    # you could assert select the error message eg. 'Invalid title name'
    assert_response :unprocessable_entity
  end

  test 'can destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end
    assert_redirected_to projects_url
  end
end
