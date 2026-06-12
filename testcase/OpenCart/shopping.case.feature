@testcase @high
Feature: Navegación y Búsqueda (OpenCart)
  Como cliente de la tienda
  Quiero buscar y navegar por el catálogo
  Para encontrar los productos que deseo comprar

  Background:
    * field project = OpenCart
    * field module = Shopping
    Given el usuario se encuentra en la página de inicio de OpenCart

  @tc-01
  Scenario: Buscar un producto específico
    When el usuario ingresa "MacBook" en la barra de búsqueda superior
    And hace clic en el ícono de la lupa (Buscar)
    Then la página de resultados muestra al menos un producto relacionado con "MacBook"

  @tc-02
  Scenario: Navegar por categorías del menú
    When el usuario pasa el cursor sobre la categoría "Desktops" en el menú principal
    And selecciona la subcategoría "Mac (1)"
    Then el sistema muestra los productos correspondientes a la categoría "Mac"
    And se visualiza el producto "iMac" en la cuadrícula de productos
