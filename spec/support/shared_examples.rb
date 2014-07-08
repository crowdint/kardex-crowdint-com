shared_examples_for 'success rendering' do
  it { expect(response).to be_success }
  it { expect(response).to render_template action }
end
