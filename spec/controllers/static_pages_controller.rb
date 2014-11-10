require 'spec_helper'

describe StaticPagesController do

  describe 'GET about' do
    subject { get :about }

    its(:status) { should == 200 }
  end
end