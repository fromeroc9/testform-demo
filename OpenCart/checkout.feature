@testcase @high
Feature: Proceso de Compra - Checkout (OpenCart)
  Como cliente con productos en el carrito
  Quiero finalizar mi compra
  Para procesar mi pedido correctamente

  Background:
    * field type_of_test = funcional
    Given el usuario tiene productos en su carrito
    And navega a la página de "Checkout" haciendo clic en el enlace superior

  @tc-01
  Scenario: Completar la compra como invitado (Guest Checkout)
    When el usuario selecciona la opción "Guest Checkout" en la sección "Checkout Options"
    And hace clic en "Continue"
    And llena los datos personales requeridos en "Billing Details"
    And selecciona un método de envío (Flat Shipping Rate)
    And selecciona el método de pago (Cash On Delivery)
    And marca la casilla para aceptar los Términos y Condiciones
    And hace clic en "Confirm Order"
    Then el sistema muestra la pantalla final "Your order has been placed!"

  @tc-02
  Scenario: Error al procesar el pago por no aceptar los términos
    When el usuario llega al paso de "Payment Method"
    And desmarca o no acepta la casilla de los Términos y Condiciones
    And hace clic en "Continue"
    Then el sistema muestra una advertencia indicando "Warning: You must agree to the Terms & Conditions!"
