require 'test_helper'

class PhotoPostsControllerTest < ActionController::TestCase
  setup do
    @photo_post = photo_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_post" do
    assert_difference('PhotoPost.count') do
      post :create, photo_post: { description: @photo_post.description, image: @photo_post.image, published: @photo_post.published, references: @photo_post.references, title: @photo_post.title }
    end

    assert_redirected_to photo_post_path(assigns(:photo_post))
  end

  test "should show photo_post" do
    get :show, id: @photo_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_post
    assert_response :success
  end

  test "should update photo_post" do
    patch :update, id: @photo_post, photo_post: { description: @photo_post.description, image: @photo_post.image, published: @photo_post.published, references: @photo_post.references, title: @photo_post.title }
    assert_redirected_to photo_post_path(assigns(:photo_post))
  end

  test "should destroy photo_post" do
    assert_difference('PhotoPost.count', -1) do
      delete :destroy, id: @photo_post
    end

    assert_redirected_to photo_posts_path
  end
end
