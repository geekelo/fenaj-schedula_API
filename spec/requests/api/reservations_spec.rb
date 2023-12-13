# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Blogs API' do

  path '/api/v1/reservations' do

    post 'Creates a reservation' do
      tags 'Blogs'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          city: { type: :string },
          date: { type: :date },
          item_id: { type: :integer },
          user_id: { type: :integer },
        },
        required: ['city', 'date', 'user_id', 'item_id' ]
      }

      response '201', 'reservation created' do
        let(:reservation) { "Spa Session Items has been successfully created." }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { "An error occurred" }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do

    get 'Retrieves a reservations' do
      tags 'Reservations', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer
      request_body_example value: { some_field: 3 }, name: 'basic', summary: 'Request example description'

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            city: { type: :string },
            date: { type: :date },
            item_id: { type: :integer },
            user_id: { type: :integer },
          },
          required: [ 'id' ]

        let(:id) { Reservations.create(
          city: 'Second Spa session',
          image: '2022-01-01',
          item_id: 1,
          user_id: 2
        ).id }
        run_test!
      end

      response '404', 'Reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end


  path '/api/v1/reservations/{id}' do

    delete 'Delete a reservations' do
      tags 'Reservations', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer
      request_body_example value: { some_field: 3 }, name: 'basic', summary: 'Request example description'

   
      response '200', 'Successful' do
        let(:id) { 'SUccessful' }
        run_test!
      end   
      

      response '404', 'Reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end