require 'rails_helper'

RSpec.describe "V1::Posts", type: :request do
  describe 'Add post' do

    let(:new_post) { FactoryBot.build :post}
    let(:params) do
      {
          title: new_post.title,
          description: new_post.description
      }
    end

    subject do
      post '/api/v1/posts', params: { post: params }
    end

    it 'Post mast be created' do
      expect { subject }.to change(Post, :count).by(1)
    end

  end
end
