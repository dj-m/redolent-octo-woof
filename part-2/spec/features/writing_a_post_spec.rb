require_relative "../spec_helper"

feature "writing a new post" do
  background(:each) do
    @previous_post = create(:post)
  end

  context "without javascript" do
    scenario "user navigates to post form, submits it, and sees the post", { js: false } do
      visit "/"
      expect(page).to have_content "Share Anything"
      expect(page).to have_content @previous_post.title
      click_link("Share Your Thoughts")


      expect(page).to have_content "Write Your Post"
      within("#post_form") do
        fill_in "post[title]", with: "Bright Idea"
        fill_in "post[author_name]", with: "Evelyn"
        fill_in "post[body]", with: "I've been doing a lot of thinking ..."
        find("input[name='submit']").click
      end

      expect(page).to have_content "The Post ..."
      expect(page).to have_content "Bright Idea"
      expect(page).to have_content "Evelyn"
      expect(page).to have_content "I've been doing a lot of thinking ..."
    end
  end

  context "with javascript" do
    scenario "user navigates to post form, submits it, and sees the post", { js: true } do
      visit "/"
      expect(page).to have_content "Share Anything"
      expect(page).to have_content @previous_post.title


      click_link("Share Your Thoughts")
      # Stay on page
      expect(page).to have_content(@previous_post.title), "Clicking the 'Share Your Thoughts' link should not navigate to a new page."
      # Link goes away
      expect(page).to_not have_content("Share Your Thoughts"), "The 'Share Your Thoughts' link should be hidden."
      # Add the post form to the page
      expect(page).to have_selector("#post_form"), "The post form should be on the page."
      # Don't render the posts/new template
      expect(page).to_not have_content("Write Your Post"), "Just the form for creating a new post should be added to the page."


      # Fill in the form
      within("#post_form") do
        fill_in "post[title]", with: "Bright Idea"
        fill_in "post[author_name]", with: "Evelyn"
        fill_in "post[body]", with: "I've been doing a lot of thinking ..."
      end

      # Submit the form
      find("input[name='submit']").click


      # Submitting the form stays on the page
      expect(page).to have_content(@previous_post.title), "Submitting the form should not navigate to a new page."
      # New post is added to the DOM
      expect(page).to have_content("Bright Idea"), "The new post should be added to the page."
      expect(page).to have_content("Evelyn"), "The new post should be added to the page."
      expect(page).to have_content("I've been doing a lot of thinking ..."), "The new post should be added to the page."
      # Don't render the posts/show template
      expect(page).to_not have_content("The Post ..."), "Just the new post should be added to the page."


      # Remove form and show link again
      expect(page).to_not have_selector("#post_form"), "The post form should be removed from the DOM."
      expect(page).to have_content("Share Your Thoughts"), "The 'Share Your Thoughts' link should be visible."
    end
  end
end
