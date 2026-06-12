@testcase
Feature: Módulo de Carrito de Compras (Cart)
  Como cliente con productos seleccionados
  Quiero revisar mi carrito
  Para asegurar que mi orden es correcta antes de proceder al pago

  Background:
    * field project = SauceDemo
    * field module = Cart
    Given el usuario ha iniciado sesión como "standard_user"
    And ha agregado el producto "Sauce Labs Bike Light" al carrito
    When hace clic en el ícono superior derecho del carrito

  @tc-01
  Scenario: Visualizar los productos agregados
    Then el usuario debe ver la vista "Your Cart"
    And el producto "Sauce Labs Bike Light" debe estar en la lista con QTY "1"

  @tc-02
  Scenario: Remover un producto desde el carrito
    When el usuario hace clic en el botón "Remove" del producto
    Then el producto desaparece inmediatamente de la lista
    And el carrito se muestra vacío

  @tc-03
  Scenario: Continuar comprando desde el carrito
    When el usuario hace clic en el botón inferior izquierdo "Continue Shopping"
    Then el sistema lo redirige de vuelta a la página de "Products"
