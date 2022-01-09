RSpec.describe "Api::V1::Passwords", type: :request do
  include_context "default request context"

  let(:url) { "/api/v1/password" }
  let(:data_type) { :accounts }

  describe "#create" do
    let(:email) { account.email }
    let(:attributes) { {email: email} }
    let(:http_verb) { :post }

    include_examples "expect success status"

    context "with inexistent user" do
      let(:email) { "test@test.com" }

      include_examples "expect unprocessable entity status"
    end
  end

  describe "#update" do
    let(:attributes) { {password: password, reset_password_token: token} }
    let(:password) { SecureRandom.alphanumeric(10) }
    let(:token) { account.send(:set_reset_password_token) }
    let(:http_verb) { :put }

    include_examples "expect success status"
  end
end
