require 'spec_helper'
require 'authlogic/test_case'
include Authlogic::TestCase

describe UserSessionsController do
  setup :activate_authlogic

  let(:user_session) { {} }

  describe "POST create" do
    subject { post :create, user_session: user_session}

    context "with user" do
      let(:user) { create :user }
      let(:user_session) { { login: user.login, password: user.password } }

      its(:status) { should redirect_to(admin_posts_url) }
    end

    context "without user" do
      its(:status) { should render_template(:new) }
    end
  end

  describe "DELETE destroy" do
    subject { delete :destroy, user_session: user_session}

    context "with existing user session" do
      before { log_in(user) }

      let(:user) { create :user }

      its(:status) { should redirect_to(root_url) }
    end

    context "without user session" do
      its(:status) { should redirect_to(root_url) }
    end
  end
end