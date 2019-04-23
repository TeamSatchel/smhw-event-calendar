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

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#resource' do
    context do
      before { subject.instance_variable_set :@resource, :resource }

      its(:resource) { should eq :resource }
    end
  end

  describe '#initialize_resource' do
    before { expect(Event).to receive(:new).and_return(:resource) }

    before { subject.send :initialize_resource }

    its(:resource) { should eq :resource }
  end

  describe '#new.js' do
    before { expect(subject).to receive(:initialize_resource) }

    before { get :new, xhr: true, format: :js }

    it { should render_template :new }
  end

  describe '#resource_params' do
    let :params do
      acp event: {
        title: nil,
        start_date: nil,
        end_date: nil,
        teacher_name: nil,
        description: nil
      }
    end

    before { expect(subject).to receive(:params).and_return(params) }

    its(:resource_params) { should eq params[:event].permit! }
  end

  describe '#build_resource' do
    before { expect(subject).to receive(:resource_params).and_return(:resource_params) }

    before { expect(Event).to receive(:new).with(:resource_params).and_return(:resource) }

    before { subject.send :build_resource }

    its(:resource) { should eq :resource }
  end

  describe '#create.js' do
    let(:resource) { double }

    before { expect(subject).to receive(:build_resource) }

    before { expect(subject).to receive(:resource).and_return(resource) }

    context do
      before { expect(resource).to receive(:save).and_return(true) }

      before { post :create, xhr: true, format: :js }

      it { should render_template :create }
    end

    context do
      before { expect(resource).to receive(:save).and_return(false) }

      before { post :create, xhr: true, format: :js }

      it { should render_template :errors }
    end
  end
end
