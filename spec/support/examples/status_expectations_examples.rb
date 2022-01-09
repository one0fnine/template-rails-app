RSpec.shared_examples "expect success status" do
  it "returns success" do
    expect(response).to have_http_status :success
  end
end

RSpec.shared_examples "expect not found status" do
  it "returns success" do
    expect(response).to have_http_status :not_found
  end
end

RSpec.shared_examples "expect accepted status" do
  it "returns accepted" do
    expect(response).to have_http_status :accepted
  end
end

RSpec.shared_examples "expect no_content status" do
  it "returns no_content" do
    expect(response).to have_http_status :no_content
  end
end

RSpec.shared_examples "expect forbidden status" do
  it "returns forbidden" do
    expect(response).to have_http_status :forbidden
  end
end

RSpec.shared_examples "expect unauthorized status" do
  it "returns forbidden" do
    expect(response).to have_http_status :unauthorized
  end
end

RSpec.shared_examples "expect unprocessable entity status" do
  it "returns unprocessable entity" do
    expect(response).to have_http_status :unprocessable_entity
  end
end
