# API Documentation

## Descripción General

Este documento describe las rutas y acciones disponibles para los controladores `ProductsController` y `OrdersController` dentro del módulo `Api::V1` de la aplicación.

## Controlador `ProductsController`

### Rutas

- `GET /api/v1/products` - Listar todos los productos.
- `GET /api/v1/products/:id` - Mostrar un producto específico.
- `POST /api/v1/products` - Crear un nuevo producto.
- `PUT /api/v1/products/:id` - Actualizar un producto existente.
- `DELETE /api/v1/products/:id` - Eliminar un producto.

### Acciones

#### index

- **Descripción**: Devuelve una lista de todos los productos.
- **Método HTTP**: `GET`
- **Ruta**: `/api/v1/products`
- **Respuesta Exitosa**:
  - **Código**: `200 OK`
  - **Cuerpo**:
    ```json
    [
      {
        "id": 1,
        "name": "Product 1",
        "price": 100,
        "created_at": "2023-08-01T00:00:00Z",
        "updated_at": "2023-08-01T00:00:00Z"
      },
      {
        "id": 2,
        "name": "Product 2",
        "price": 200,
        "created_at": "2023-08-02T00:00:00Z",
        "updated_at": "2023-08-02T00:00:00Z"
      }
    ]
    ```

#### show

- **Descripción**: Devuelve los detalles de un producto específico.
- **Método HTTP**: `GET`
- **Ruta**: `/api/v1/products/:id`
- **Parámetros de Ruta**:
  - `id`: ID del producto que se desea obtener.
- **Respuesta Exitosa**:
  - **Código**: `200 OK`
  - **Cuerpo**:
    ```json
    {
      "id": 1,
      "name": "Product 1",
      "price": 100,
      "created_at": "2023-08-01T00:00:00Z",
      "updated_at": "2023-08-01T00:00:00Z"
    }
    ```

#### create

- **Descripción**: Crea un nuevo producto.
- **Método HTTP**: `POST`
- **Ruta**: `/api/v1/products`
- **Parámetros del Cuerpo**:
  - `product`: Objeto que contiene los atributos del producto.
    - `name`: Nombre del producto (requerido).
    - `price`: Precio del producto (requerido).
- **Ejemplo de Solicitud**:
  ```json
  {
    "product": {
      "name": "New Product",
      "price": 150
    }
  }


## Descripción General

Este documento describe el endpoint disponible en el controlador `OrdersController` dentro del módulo `Api::V1` de la aplicación.

## Controlador `OrdersController`

### Rutas

- `POST /api/v1/orders` - Crear un nuevo pedido.

### Acciones

#### create

- **Descripción**: Crea un nuevo pedido.
- **Método HTTP**: `POST`
- **Ruta**: `/api/v1/orders`
- **Parámetros del Cuerpo**:
  - `order`: Objeto que contiene los atributos del pedido.
    - `currency`: Moneda del pedido (requerido).
    - `products`: Lista de productos en el pedido (requerido).
      - `id`: ID del producto (requerido).
      - `quantity`: Cantidad del producto (requerido).
    - `customer_info`: Información del cliente (requerido).
      - `email`: Correo electrónico del cliente (requerido).
      - `name`: Nombre del cliente (requerido).
      - `phone`: Teléfono del cliente (opcional).

##### Ejemplo de Solicitud
```json
{
  "order": {
    "currency": "USD",
    "products": [
      {
        "id": 1,
        "quantity": 2
      }
    ],
    "customer_info": {
      "email": "customer@example.com",
      "name": "John Doe",
      "phone": "123456789"
    }
  }
}
```
## Postman collection
https://api.postman.com/collections/5470141-bab50702-33b9-4d6b-a734-a1e3ab3eb522?access_key=PMAT-01J4HM0NFPKWDQWCM732JJM10Q

## Diagrama de la base de datos
* ...
<img width="705" alt="Screenshot 2024-08-05 at 07 36 16" src="https://github.com/user-attachments/assets/5b2f1508-a0bf-40c2-889e-238b1c6f1fc2">
