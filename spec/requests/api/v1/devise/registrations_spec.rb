RSpec.describe "Api::V1::Registrations", type: :request do
  describe "#create" do
    include_context "default request context"

    let(:url) { "/api/v1/sign_up" }
    let(:http_verb) { :post }
    let(:data_type) { :accounts }
    let(:attributes) do
      {
        email: "email-42@domain.com",
        password: SecureRandom.alphanumeric(8)
      }
    end

    context "when params correct" do
      include_examples "expect success status"
    end
  end
end
