require "swagger_helper"

describe "Authentication API" do
  path "/v1/signup" do
    post "Creates a user" do
      tags "Authentication"
      consumes "application/json"
      parameter name: :authenticate, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          username: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
        },
        required: ["email", "username", "password", "password_confirmation"],
      }

      response "201", "blog created" do
        let(:authenticate) { { email: "foo@money.com", username: "bar", password: "1234", password_confirmation: "1234" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:authenticate) { { email: "foo" } }
        run_test!
      end
    end
  end

  path "/v1/login" do
    post "Login" do
      tags "Authentication"
      consumes "application/json"
      parameter name: :authenticate, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
        },
        required: ["email", "password"],
      }

      response "201", "blog created" do
        let(:authenticate) { { id: 2, email: "bar@dada.com", username: "1234", token: "12233232323" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:authenticate) { { email: "foo" } }
        run_test!
      end
    end
  end
end
