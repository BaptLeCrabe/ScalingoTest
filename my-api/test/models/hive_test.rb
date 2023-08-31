# frozen_string_literal: true

require 'test_helper'

class HiveTest < ActiveSupport::TestCase
  test 'should not save without name' do
    my_model = Hive.new(weight: 123)
    assert_not my_model.save, 'Expected the model to be invalid without a name'
  end

  test 'should not save without weight' do
    my_model = Hive.new(name: 'abcdefg')
    assert_not my_model.save, 'Expected the model to be invalid without a weight'
  end

  test 'should not save with name length less than 6' do
    my_model = Hive.new(name: 'a', weight: 123)
    assert_not my_model.save, 'Expected the model to be invalid with a name length less than 6'
  end

  test 'should not save with non-numeric weight' do
    my_model = Hive.new(name: 'abcdefg', weight: 'not_numeric')
    assert_not my_model.save, 'Expected the model to be invalid with a non-numeric weight'
  end

  test 'should save with valid attributes' do
    my_model = Hive.new(name: 'abcdefg', weight: 123)
    assert my_model.save, 'Expected the model to be saved with valid attributes'
  end
end
