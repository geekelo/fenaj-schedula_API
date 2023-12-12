### Spa Session   Item API Documentation
Welcome to the Spa Session Item API documentation. This API allows you to manage spa session items.
### Authentication
All endpoints in this API require authentication. You need to include a valid authentication token in the headers of your requests.
#### Headers
- **Authorization**: Bearer `<your_token>`
### Endpoints
#### 1. Get All Items
**Endpoint:** `/api/v1/items`
**Method:** `GET`
**Description:** Get a list of all spa session items.
**Response:**
```json
{
  "items": [
    {
      "name": "First Spa session",
      "description": "This is the first spa session",
      "image": "",
      "deposit": 1,
      "spa_session_fee": 1000,
      "registration_fee": 300,
      "total_amount_payable": 300,
      "duration": 1,
      "user_id": 1
    },
    {
      "name": "Second Spa session",
      "description": "This is the second spa session",
      "image": "",
      "deposit": 1,
      "spa_session_fee": 100,
      "registration_fee": 500,
      "total_amount_payable": 400,
      "duration": 6,
      "user_id": 2
    }
  ]
}
```
#### 2. Get a Single Item
**Endpoint:** `/api/v1/items/:id`
**Method:** `GET`
**Description:** Get details of a specific spa session items.
**Response:**
```json
{
  name: 'Second Spa session',
  description: 'this the Second spa session',
  image: '',
  deposit: 1,
  spa_session_fee: 100,
  registration_fee: 500,
  total_amount_payable: 400,
  duration: 5,
  user_id: 2
}
```
#### 3. Create a Item
**Endpoint:** `/api/v1/items`
**Method:** `POST`
**Description:** Create a new spa session items.
**Request Body:**
```json
{
  name: 'Second Spa session',
  description: 'this the Second spa session',
  image: '',
  deposit: 1,
  spa_session_fee: 100,
  registration_fee: 500,
  total_amount_payable: 400,
  duration: 5,
  user_id: 2
}
```
**Response:**
```json
{
  "message": "Spa Session Items has been successfully created."
}
```
#### 4. Delete a Item
**Endpoint:** `/api/v1/items/:id`
**Method:** `DELETE`
**Description:** Delete a spa session item.
**Response:**
```json
{
  "status": "success",
  "message": "Item deleted successfully"
}
```
### Error Handling
- **401 Unauthorized:** The request lacks valid authentication credentials.
- **422 Unprocessable Entity:** Invalid request parameters or unable to create the item.