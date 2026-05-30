Feature: Módulo de Checkout (Pago y Envío)
  Como cliente con productos en el carrito
  Quiero completar mi compra
  Para finalizar mi orden y recibir los productos

  Background:
    Given el usuario ha iniciado sesión
    And está en la vista del carrito con productos agregados
    And hace clic en el botón inferior derecho "Checkout"

  Scenario: Llenar información de envío exitosamente
    When el usuario ingresa su nombre "Juan" en "First Name"
    And ingresa su apellido "Pérez" en "Last Name"
    And ingresa el código postal "12345" en "Zip/Postal Code"
    And hace clic en el botón "Continue"
    Then el sistema lo redirige a la pantalla "Checkout: Overview"

  Scenario: Validar error por falta de información de envío
    When el usuario deja todos los campos vacíos
    And hace clic en "Continue"
    Then el sistema muestra el mensaje de error "Error: First Name is required"

  Scenario: Finalizar compra exitosamente
    Given el usuario ha completado el formulario de envío y está en "Checkout: Overview"
    When verifica que el precio "Item total" y los impuestos "Tax" sean correctos
    And hace clic en el botón verde "Finish"
    Then el sistema muestra la pantalla "Checkout: Complete!"
    And el usuario visualiza el mensaje "Thank you for your order!"
