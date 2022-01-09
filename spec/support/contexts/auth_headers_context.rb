RSpec.shared_context "auth headers context" do
  let(:headers) { Devise::JWT::TestHelpers.auth_headers({}, account) }
end
