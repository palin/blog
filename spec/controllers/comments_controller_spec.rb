require 'spec_helper'

describe CommentsController do

  describe "DELETE destroy" do
    let(:post) { create :post }

    context "exisiting comment" do
      subject { delete :destroy, post_id: post.id, id: comment.id }

      before { UserSession.stub(:find).and_return(double(user: double)) }

      let(:comment) { create :comment, post: post }

      its(:status) { should redirect_to(post_path(post)) }
      it { expect(subject.request.flash[:notice]).to eq("Successfully deleted comment!") }
    end

    context "nonexistent comment" do
      subject { delete :destroy, post_id: post.id, id: 'nonexistent' }

      its(:status) { should redirect_to(post_path(post)) }
      it { expect(subject.request.flash[:notice]).to eq("Couldn't delete comment!") }
    end

  end
end