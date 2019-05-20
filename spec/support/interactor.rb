RSpec::Matchers.define :ok_interaction do |expected|
  match do |actual|
    actual.success?
  end

  failure_message do |actual|
    "Interaction failed with errors: #{ actual.errors.inspect }"
  end
end

RSpec::Matchers.define :fail_interaction do |expected|
  match do |actual|
    !actual.success?
  end

  failure_message do |actual|
    "Interaction did not fail"
  end
end