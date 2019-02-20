RSpec.describe Events::Creator, type: :service do
  describe '#create_new_event!' do
    let(:params) do
      {
        start_date: start_date,
        end_date: end_date,
        title: 'This is a title',
        description: '01A Maths',
        signature: 'Mr N Gohil'
      }
    end

    it 'crea' do
    end
  end
end
