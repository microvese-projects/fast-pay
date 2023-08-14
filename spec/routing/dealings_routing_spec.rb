require "rails_helper"

RSpec.describe DealingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dealings").to route_to("dealings#index")
    end

    it "routes to #new" do
      expect(get: "/dealings/new").to route_to("dealings#new")
    end

    it "routes to #show" do
      expect(get: "/dealings/1").to route_to("dealings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dealings/1/edit").to route_to("dealings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dealings").to route_to("dealings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dealings/1").to route_to("dealings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dealings/1").to route_to("dealings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dealings/1").to route_to("dealings#destroy", id: "1")
    end
  end
end
