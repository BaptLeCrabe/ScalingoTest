# frozen_string_literal: true

require 'test_helper'

class HarvestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @harvest = harvests(:one)
  end

  test 'should get index' do
    get harvests_url, as: :json
    assert_response :success
  end

  test 'should create harvest' do
    assert_difference('Harvest.count') do
      post harvests_url,
           params: { harvest: { date: @harvest.date, hive_id: @harvest.hive_id, weight: @harvest.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show harvest' do
    get harvest_url(@harvest), as: :json
    assert_response :success
  end

  test 'should update harvest' do
    patch harvest_url(@harvest),
          params: { harvest: { date: @harvest.date, hive_id: @harvest.hive_id, weight: @harvest.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy harvest' do
    assert_difference('Harvest.count', -1) do
      delete harvest_url(@harvest), as: :json
    end

    assert_response :no_content
  end
end
