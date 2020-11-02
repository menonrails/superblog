require 'rails_helper'

RSpec.describe "V1::Comments", type: :request do
  describe 'Add comment' do
    let(:blog_post) { FactoryBot.create :post }
    let(:new_comment) { FactoryBot.build :comment }
    let(:params) do
      {
          name: new_comment.name,
          email: new_comment.email,
          comment_text: new_comment.comment_text,
      }
    end

    subject do
      post "/api/v1/posts/#{blog_post.id}/comments", params: { comment: params }
    end

    it 'Comment mast be created' do
      expect { subject }.to change(Comment, :count).by(1)
    end
  end
end