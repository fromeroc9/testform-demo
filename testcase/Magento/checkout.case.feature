@testcase
Feature: Flujo de Pago y Orden (Checkout Magento / Luma)
  Como cliente con artículos en el carrito
  Quiero completar el formulario de envío y pago
  Para finalizar mi orden exitosamente

  Background:
    * field project = Magento
    * field module = checkout
    Given el usuario tiene al menos un producto en su carrito
    And navega a la página principal de "Checkout"

  @tc-01 @low
  Scenario: Completar el paso de Envío (Shipping Step)
    When el usuario ingresa su correo electrónico (si actúa como invitado)
    And ingresa su dirección de envío, ciudad, código postal y teléfono
    And selecciona un método de envío disponible (ej. "Flat Rate - Fixed")
    And hace clic en el botón "Next"
    Then el sistema avanza al segundo paso "Review & Payments"

  @tc-02
  Scenario: Validar el resumen y realizar el pago (Payment Step)
    Given el usuario se encuentra en el paso de "Review & Payments"
    When revisa que la sección "Ship To:" contenga la dirección correcta
    And verifica el total final en la sección "Order Summary"
    And hace clic en el botón inferior "Place Order"
    Then la página finaliza el proceso mostrando el título "Thank you for your purchase!"
    And el sistema genera y muestra el número de orden (Ej. Order # 000001234)
