require 'spec_helper'

describe CommentsController do
  describe 'DELETE destroy' do
    let(:post) { create :post }
    let(:flash) { subject.request.flash[:notice] }

    context 'exisiting comment' do
      subject { delete :destroy, post_id: post.id, id: comment.id }

      let(:comment) { create :comment, post: post }

      context 'with user' do
        before { UserSession.stub(:find).and_return(double(user: double)) }

        its(:status) { should redirect_to(post_path(post)) }
        it { expect(flash).to eq('Successfully deleted comment!') }
      end

      context 'without user' do
        its(:body) { should be_blank }
        its(:status) { should eq(403) }
      end
    end

    context 'nonexistent comment' do
      before { UserSession.stub(:find).and_return(double(user: double)) }

      subject { delete :destroy, post_id: post.id, id: 'nonexistent' }

      its(:status) { should redirect_to(post_path(post)) }
      it { expect(flash).to eq("Couldn't delete comment!") }
    end
  end
end
