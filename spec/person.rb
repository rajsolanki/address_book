it 'should check if email is valid format' do
  user.email = 'invalid email'
  should_not_be_valid
end

