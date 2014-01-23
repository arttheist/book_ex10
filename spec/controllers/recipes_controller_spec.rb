require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RecipesController do

  # This should return the minimal set of attributes required to create a valid
  # Recipe. As you add validations to Recipe, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RecipesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all recipes as @recipes" do
      recipe = Recipe.create! valid_attributes
      get :index, {}, valid_session
      assigns(:recipes).should eq([recipe])
    end
  end

  describe "GET show" do
    it "assigns the requested recipe as @recipe" do
      recipe = Recipe.create! valid_attributes
      get :show, {:id => recipe.to_param}, valid_session
      assigns(:recipe).should eq(recipe)
    end
  end

  describe "GET new" do
    it "assigns a new recipe as @recipe" do
      get :new, {}, valid_session
      assigns(:recipe).should be_a_new(Recipe)
    end
  end

  describe "GET edit" do
    it "assigns the requested recipe as @recipe" do
      recipe = Recipe.create! valid_attributes
      get :edit, {:id => recipe.to_param}, valid_session
      assigns(:recipe).should eq(recipe)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Recipe" do
        expect {
          post :create, {:recipe => valid_attributes}, valid_session
        }.to change(Recipe, :count).by(1)
      end

      it "assigns a newly created recipe as @recipe" do
        post :create, {:recipe => valid_attributes}, valid_session
        assigns(:recipe).should be_a(Recipe)
        assigns(:recipe).should be_persisted
      end

      it "redirects to the created recipe" do
        post :create, {:recipe => valid_attributes}, valid_session
        response.should redirect_to(Recipe.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipe as @recipe" do
        # Trigger the behavior that occurs when invalid params are submitted
        Recipe.any_instance.stub(:save).and_return(false)
        post :create, {:recipe => { "title" => "invalid value" }}, valid_session
        assigns(:recipe).should be_a_new(Recipe)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Recipe.any_instance.stub(:save).and_return(false)
        post :create, {:recipe => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested recipe" do
        recipe = Recipe.create! valid_attributes
        # Assuming there are no other recipes in the database, this
        # specifies that the Recipe created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Recipe.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => recipe.to_param, :recipe => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested recipe as @recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => valid_attributes}, valid_session
        assigns(:recipe).should eq(recipe)
      end

      it "redirects to the recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, {:id => recipe.to_param, :recipe => valid_attributes}, valid_session
        response.should redirect_to(recipe)
      end
    end

    describe "with invalid params" do
      it "assigns the recipe as @recipe" do
        recipe = Recipe.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recipe.any_instance.stub(:save).and_return(false)
        put :update, {:id => recipe.to_param, :recipe => { "title" => "invalid value" }}, valid_session
        assigns(:recipe).should eq(recipe)
      end

      it "re-renders the 'edit' template" do
        recipe = Recipe.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recipe.any_instance.stub(:save).and_return(false)
        put :update, {:id => recipe.to_param, :recipe => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested recipe" do
      recipe = Recipe.create! valid_attributes
      expect {
        delete :destroy, {:id => recipe.to_param}, valid_session
      }.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipes list" do
      recipe = Recipe.create! valid_attributes
      delete :destroy, {:id => recipe.to_param}, valid_session
      response.should redirect_to(recipes_url)
    end
  end

end
