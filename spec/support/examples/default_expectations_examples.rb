RSpec.shared_examples "default expectations examples" do |success_status, failed_status|
  context "when user is authenticated" do
    include_context "auth headers context"
    include_examples "expect #{success_status || "success"} status"
  end

  context "when user is unauthenticated" do
    include_examples "expect #{failed_status || "unauthorized"} status"
  end
end
