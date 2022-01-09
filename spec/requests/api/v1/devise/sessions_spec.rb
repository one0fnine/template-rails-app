RSpec.describe "Api::V1::Sessions", type: :request do
  include_context "default request context"

  describe "#create" do
    let(:url) { "/api/v1/sign_in" }
    let(:http_verb) { :post }
    let(:data_type) { :accounts }

    context "when authentication is successful" do
      let(:attributes) { {email: account.email, password: account.password} }

      include_examples "expect success status"

      it "returns JTW token in authorization header" do
        expect(response.headers["Authorization"]).to be_present
      end
    end

    context "when authentication is failed" do
      let(:attributes) { {} }

      include_examples "expect unauthorized status"
    end

    describe "#destroy" do
      let(:url) { "/api/v1/sign_out" }

      it "returns 204, no content" do
        delete url
        expect(response).to have_http_status :no_content
      end
    end
  end
end
