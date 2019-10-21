require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do
  describe '#index' do
    login_user
    before do
      create(:user)
    end
    context 'Title of context' do
      it 'Title of it' do

      end
    end
  end
end
