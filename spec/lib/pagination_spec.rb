require 'spec_helper'
require 'pagination'

describe Pagination do

  let(:paginate_by) { 3 }
  let(:posts) { [] }
  let(:new_post) { FactoryGirl.create(:post) }
  let!(:post) { 10.times { posts.push new_post } }
  let(:params) { { page: 1 } }

  subject { Pagination.new(posts, paginate_by, params) }

  context "#total_records" do
    describe "for 1 post" do
      let!(:post) { posts.push new_post }

      its(:total_records) { should == 1 }
    end

    describe "for 10 posts" do
      let!(:post) { 10.times { posts.push new_post } }

      its(:total_records) { should == 10 }
    end

    describe "for 49 posts" do
      let!(:post) { 49.times { posts.push new_post } }

      its(:total_records) { should == 49 }
    end
  end

  context "#total_pages" do
    describe "for 0 records" do
      let!(:post) { posts = [] }

      its(:total_pages) { should == 1 }
    end
    describe "for 1 record" do
      let!(:post) { posts.push new_post }

      its(:total_pages) { should == 1 }
    end
    describe "for 10 records" do
      let!(:post) { 10.times { posts.push new_post } }

      its(:total_pages) { should == 4 }
    end
    describe "for 30 records" do
      let!(:post) { 30.times { posts.push new_post } }

      its(:total_pages) { should == 10 }
    end
    describe "for 35 records" do
      let!(:post) { 35.times { posts.push new_post } }

      its(:total_pages) { should == 12 }
    end
  end

  context "#this_page" do
    describe "no params" do
      let!(:params) { {} }

      its(:this_page) { should == 1 }
    end

    describe "params given" do
      context "3rd page" do
        let!(:params) { { page: 3 } }

        its(:this_page) { should == 3 }
      end

      context "21st page" do
        let!(:params) { { page: 21 } }

        its(:this_page) { should == 21 }
      end
    end
  end

  context "#next_page" do
    let!(:params) { { page: 3 } }

    its(:next_page) { should == 4 }
  end

  context "#previous_page" do
    context "parameter is an integer" do
      let!(:params) { { page: 4 } }

      its(:previous_page) { should == 3 }
    end

    context "parameter is a string" do
      let!(:params) { { page: "4" } }

      its(:previous_page) { should == 3 }
    end
  end

  context "#first_page" do
    its(:first_page) { should == 1 }
  end

  context "#last_page" do
    its(:last_page) { should == 4 }
  end

  context "#is_first_page?" do
    describe "no params" do
      let!(:params) { {} }

      its(:is_first_page?) { should == true }
    end

    describe "page parameter" do
      context "1st page" do
        let!(:params) { { page: 1 } }

        its(:is_first_page?) { should == true }
      end

      context "3rd page" do
        let!(:params) { { page: 3 } }

        its(:is_first_page?) { should == false }
      end
    end
  end

  context "#is_last_page?" do
    describe "no params" do
      let!(:params) { {} }

      its(:is_last_page?) { should == false }
    end

    describe "page parameter" do
      context "1st page" do
        let!(:params) { { page: 1 } }

        its(:is_last_page?) { should == false }
      end

      context "3rd page" do
        let!(:params) { { page: 3 } }

        its(:is_last_page?) { should == false }
      end

      context "4rd page" do
        let!(:params) { { page: 4 } }

        its(:is_last_page?) { should == true }
      end
    end
  end

  context "#pages" do
    subject { Pagination.new(posts, 1, params) }

    context "there is 10 pages" do
      describe "on a first page" do
        let!(:params) { { page: 1 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a second page" do
        let!(:params) { { page: 2 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a third page" do
        let!(:params) { { page: 3 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a fourth page" do
        let!(:params) { { page: 4 } }

        its(:pages) { should == (2..6) }
      end

      describe "on a fifth page" do
        let!(:params) { { page: 5 } }

        its(:pages) { should == (3..7) }
      end

      describe "on a sixth page" do
        let!(:params) { { page: 6 } }

        its(:pages) { should == (4..8) }
      end

      describe "on a seventh page" do
        let!(:params) { { page: 7 } }

        its(:pages) { should == (5..9) }
      end

      describe "on an eighth page" do
        let!(:params) { { page: 8 } }

        its(:pages) { should == (6..10) }
      end

      describe "on a nineth page" do
        let!(:params) { { page: 9 } }

        its(:pages) { should == (6..10) }
      end

      describe "on a tenth page" do
        let!(:params) { { page: 10 } }

        its(:pages) { should == (6..10) }
      end
    end

    context "there is 7 pages" do
      let!(:post) { 7.times { posts.push new_post } }

      describe "on a first page" do
        let!(:params) { { page: 1 } }

        its(:pages) { should == (1..5)  }
      end

      describe "on a second page" do
        let!(:params) { { page: 2 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a third page" do
        let!(:params) { { page: 3 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a fourth page" do
        let!(:params) { { page: 4 } }

        its(:pages) { should == (2..6) }
      end

      describe "on a fifth page" do
        let!(:params) { { page: 5 } }

        its(:pages) { should == (3..7) }
      end

      describe "on a sixth page" do
        let!(:params) { { page: 6 } }

        its(:pages) { should == (3..7) }
      end

      describe "on a seventh page" do
        let!(:params) { { page: 7 } }

        its(:pages) { should == (3..7) }
      end
    end

    context "there is 5 pages" do
      let!(:post) { 5.times { posts.push new_post } }

      describe "on a first page" do
        let!(:params) { { page: 1 } }

        its(:pages) { should == (1..5)  }
      end

      describe "on a second page" do
        let!(:params) { { page: 2 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a third page" do
        let!(:params) { { page: 3 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a fourth page" do
        let!(:params) { { page: 4 } }

        its(:pages) { should == (1..5) }
      end

      describe "on a fifth page" do
        let!(:params) { { page: 5 } }

        its(:pages) { should == (1..5) }
      end
    end

    context "there is 4 pages" do
      let!(:post) { 4.times { posts.push new_post } }

      describe "on a first page" do
        let!(:params) { { page: 1 } }

        its(:pages) { should == (1..4) }
      end

      describe "on a second page" do
        let!(:params) { { page: 2 } }

        its(:pages) { should == (1..4) }
      end

      describe "on a third page" do
        let!(:params) { { page: 3 } }

        its(:pages) { should == (1..4) }
      end

      describe "on a fourth page" do
        let!(:params) { { page: 4 } }

        its(:pages) { should == (1..4) }
      end
    end
  end
end