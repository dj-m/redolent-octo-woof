require_relative "../spec_helper"

describe Post do
  let(:valid_post_attributes) { {body: "This is what I have to say.", author_name: "Wanda", title: "My Thoughts on Testing"} }
  let(:post) { Post.new(valid_post_attributes) }

  describe "the body" do
    it "is required" do
      no_body_attributes = valid_post_attributes.merge(body: nil)
      bodyless_post = Post.new(no_body_attributes)
      expect(bodyless_post).to_not be_valid
    end

    it "can be set" do
      expect(post.body).to eq "This is what I have to say."
    end
  end

  describe "the title" do
    it "is required" do
      no_title_attributes = valid_post_attributes.merge(title: nil)
      titleless_post = Post.new(no_title_attributes)
      expect(titleless_post).to_not be_valid
    end

    it "can be set" do
      expect(post.title).to eq "My Thoughts on Testing"
    end

  end

  describe "the author's name" do
    it "defaults to anonymous if nil" do
      no_author_attributes = valid_post_attributes.merge(author_name: nil)
      authorless_post = Post.new(no_author_attributes)
      expect(authorless_post.author_name).to eq "anonymous"
    end

    it "defaults to anonymous if empty" do
      empty_author_attributes = valid_post_attributes.merge(author_name: "")
      empty_author_post = Post.new(empty_author_attributes)
      expect(empty_author_post.author_name).to eq "anonymous"
    end

    it "defaults to anonymous if not given at all" do
      no_author_key_attributes = {body: "Butterflies", title: "Thoughts on Animals"}
      no_author_key_post = Post.new(no_author_key_attributes)
      expect(no_author_key_post.author_name).to eq "anonymous"
    end

    it "can be set" do
      expect(post.author_name).to eq "Wanda"
    end
  end
end
