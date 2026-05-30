Feature: Gestión de Carrito (OpenCart)
  Como cliente con intención de compra
  Quiero agregar y revisar productos en mi carrito
  Para asegurarme de que mi pedido sea correcto antes de pagar

  Background:
    Given el usuario ha buscado y encontrado el producto "iPhone" en la tienda

  Scenario: Agregar producto al carrito desde la vista de resultados
    When el usuario hace clic en el botón "Add to Cart" del producto "iPhone"
    Then el sistema muestra una alerta de éxito indicando "Success: You have added iPhone to your shopping cart!"
    And el botón negro superior del carrito (Mini Cart) actualiza el total de ítems y el monto (ej. "1 item(s)")

  Scenario: Visualizar y actualizar contenido del carrito de compras
    Given el usuario tiene al menos un producto en el carrito
    When hace clic en el enlace "Shopping Cart" ubicado en la barra superior
    Then se muestra la tabla con el nombre del producto, modelo, cantidad y precio unitario/total
    When el usuario cambia la cantidad a "2" y presiona el botón "Update"
    Then el sistema muestra un mensaje indicando "Success: You have modified your shopping cart!"
    And el precio total se recalcula correctamente
