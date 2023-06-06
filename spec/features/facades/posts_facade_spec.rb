require 'rails_helper'

RSpec.feature "posts_facade", vcr: { record: :new_episodes } do
  describe "filtering" do
    describe "toxicity" do
      it "very hateful", :vcr do
        title = "Fuck you, you ugly son of a whore"
        body = title
        expect(PostsFacade.new.pass_muster?(title, body)).to eq(false)
      end

      it "hateful but no profanity", :vcr do
        title = "You're a real tool. I hope your day is horrible, you monster."
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(false)
      end

      it "non-offensive profanity", :vcr do
        title = "Fuck yeah, nice job!"
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(true)
      end
    end

    describe "hate speech" do
      it "racial attacks", :vcr do
        title = "I don't really like those people, mostly because of their race."
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(false)
      end

      it "lgbtq", :vcr do
        title = "Gays shouldn't be allowed to get married."
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(false)
      end

      it "lgbtq 2", :vcr do
        title = "I don't trust trans people."
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(false)
      end

      it "mentions identity without being offensive", :vcr do
        title = "The guy I just met is filipino"
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(true)
      end

      it "mentions identity without being offensive 2", :vcr do
        title = "My lesbian friend is running an 8k with tigers today"
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(true)
      end
    end

    describe "threats" do
      it "threat 1", :vcr do
        title = "I will kill you"
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(false)
      end

      it "threat 2", :vcr do
        title = "You'd better hope I never find you, because I'm going to make your life miserable."
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(false)
      end

      it "threat 3", :vcr do
        title = "I'm going to make you wash your dishes."
        body = title
        expect(PostsFacade.new.pass_muster?(title,body)).to eq(true)
      end
    end
  end
end
