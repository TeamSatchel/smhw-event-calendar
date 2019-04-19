require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe '#collection' do
    context do
      before { subject.instance_variable_set :@collection, :collection }

      its(:collection) { should eq :collection }
    end

    context do
      before { expect(Event).to receive(:all).and_return(:collection) }

      its(:collection) { should eq :collection }
    end
  end

  describe '#index.html' do
    before { get :index }

    it { should render_template :index }
  end
end
