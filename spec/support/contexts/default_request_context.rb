RSpec.shared_context "default request context" do
  let(:account) { create :account }
  let(:params) do
    {
      **data,
      included: included_attributes,
      page: page_attributes,
      filter: filter_attributes
    }.compact
  end
  let(:data) do
    {
      data: {
        type: data_type,
        id: data_id,
        attributes: attributes,
        relationships: relationships_attributes
      }.compact
    }
  end
  let(:data_type) {}
  let(:data_id) {}
  let(:http_verb) { :get }
  let(:headers) { {} }
  let(:attributes) {}
  let(:relationships_attributes) {}
  let(:included_attributes) {}
  let(:page_attributes) {}
  let(:filter_attributes) {}
  let(:before_request) {}
  let(:url) {}

  before do |example|
    unless example.metadata[:skip_before]
      before_request
      send(http_verb, url, headers: headers, params: params) unless example.metadata[:skip_request]
      puts response.body.inspect if example.metadata[:debug]
    end
  end
end
