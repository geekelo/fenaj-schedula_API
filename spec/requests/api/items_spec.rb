# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Items API' do
  path '/api/v1/items' do
    post 'Creates a items' do
      tags 'Blogs'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string },
          image: { type: :string },
          deposit: { type: :integer },
          spa_session_fee: { type: :integer },
          registration_fee: { type: :integer },
          total_amount_payable: { type: :integer },
          duration: { type: :integer },
          user_id: { type: :integer }

        },
        required: %w[description user_id duration]
      }

      response '201', 'items created' do
        let(:reservation) { 'Spa Session Items has been successfully created.' }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { 'An error occurred' }
        run_test!
      end
    end
  end

  path '/api/v1/items/{id}' do
    get 'Retrieves a items' do
      tags 'Items', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer
      request_body_example value: { some_field: 3 }, name: 'basic', summary: 'Request example description'

      response '200', 'blog found' do
        schema type: :object,
               properties: {
                 description: { type: :string },
                 image: { type: :string },
                 deposit: { type: :integer },
                 spa_session_fee: { type: :integer },
                 registration_fee: { type: :integer },
                 total_amount_payable: { type: :integer },
                 duration: { type: :integer },
                 user_id: { type: :integer }
               },
               required: ['id']

        let(:id) do
          items.create(
            name: 'Second Spa session',
            description: 'this the Second spa session',
            image: '',
            deposit: 1,
            spa_session_fee: 100,
            registration_fee: 500,
            total_amount_payable: 400,
            duration: 5,
            user_id: 2
          ).id
        end
        run_test!
      end

      response '404', 'item not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/items/{id}' do
    delete 'Delete a item' do
      tags 'Items', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer
      request_body_example value: { some_field: 3 }, name: 'basic', summary: 'Request example description'

      response '200', 'Successful' do
        let(:id) { 'SUccessful' }
        run_test!
      end

      response '404', 'Item not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
