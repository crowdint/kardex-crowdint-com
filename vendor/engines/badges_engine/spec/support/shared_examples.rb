shared_examples_for 'success response' do
  it 'renders the view' do
    expect(response).to render_template action
  end

  it 'is success' do
    expect(response).to be_success
  end
end
