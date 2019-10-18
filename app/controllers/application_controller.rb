class ApplicationController < ActionController::Base
  rescue_from 'ActiveRecord::RecordInvalid' do |exception|
    render status: 400, plain: '400 Bad Request ', layout: false
  end
end
