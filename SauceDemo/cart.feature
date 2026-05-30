Feature: Módulo de Carrito de Compras (Cart)
  Como cliente con productos seleccionados
  Quiero revisar mi carrito
  Para asegurar que mi orden es correcta antes de proceder al pago

  Background:
    Given el usuario ha iniciado sesión como "standard_user"
    And ha agregado el producto "Sauce Labs Bike Light" al carrito
    And hace clic en el ícono superior derecho del carrito

  Scenario: Visualizar los productos agregados
    Then el usuario debe ver la vista "Your Cart"
    And el producto "Sauce Labs Bike Light" debe estar en la lista con QTY "1"

  Scenario: Remover un producto desde el carrito
    When el usuario hace clic en el botón "Remove" del producto
    Then el producto desaparece inmediatamente de la lista
    And el carrito se muestra vacío

  Scenario: Continuar comprando desde el carrito
    When el usuario hace clic en el botón inferior izquierdo "Continue Shopping"
    Then el sistema lo redirige de vuelta a la página de "Products"
