@testcase @high
Feature: Carrito de Compras y Productos Configurables (Magento / Luma)
  Como cliente interesado en un producto de ropa
  Quiero seleccionar sus atributos obligatorios y agregarlo al carrito
  Para guardarlo y proceder con la compra posteriormente

  Background:
    * field type_of_test = funcional
    * field project = Magento
    Given el usuario se encuentra en la página de detalles de una chaqueta (ej. "Proteus Fitness Jackshirt")

  @tc-01
  Scenario: Validar error al agregar al carrito sin seleccionar atributos
    When el usuario hace clic en el botón "Add to Cart" sin seleccionar ninguna talla ni color
    Then el sistema resalta los bloques de atributos
    And muestra el mensaje de validación "This is a required field." debajo de Talla (Size) y Color

  @tc-02
  Scenario: Agregar un producto configurable exitosamente al carrito
    When el usuario hace clic para seleccionar la talla "M"
    And hace clic para seleccionar el color "Blue"
    And hace clic en el botón "Add to Cart"
    Then el sistema muestra un mensaje de éxito verde indicando "You added Proteus Fitness Jackshirt to your shopping cart."
    And el contador numérico del ícono del carrito en la esquina superior derecha incrementa
