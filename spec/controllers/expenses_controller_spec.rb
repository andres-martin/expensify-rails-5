require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
    describe "GET index" do
        it 'has a 200 status code' do
            get :index
            expect(response.status).to eq(200)
        end
    end

    it { should route(:get, '/expenses').to(
        { :controller=>'expenses', :action => 'index'}) 
    }

    it { should route(:get, '/expenses/1').to(
        { :controller=>'expenses', :action => 'show', :id => 1}) 
    }

    it { should route(:patch, '/expenses/1').to(
        { :controller=>'expenses', :action => 'update', :id => 1}) 
    }

    it { should route(:delete, '/expenses/1').to(
        { :controller=>'expenses', :action => 'destroy', :id => 1}) 
    }

    it { should route(:post, '/expenses').to(
        { :controller=>'expenses', :action => 'create'}) 
    }
end
