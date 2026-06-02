@testcase
Feature: Módulo de Productos (Inventario)
  Como cliente autenticado
  Quiero ver y gestionar los productos
  Para agregarlos a mi carrito de compras

  Background:
    * field type_of_test = funcional
    Given el usuario ha iniciado sesión como "standard_user"
    And se encuentra en la página principal de "Products"

  @tc-01
  Scenario: Agregar un producto al carrito
    When el usuario hace clic en el botón "Add to cart" del producto "Sauce Labs Backpack"
    Then el botón del producto cambia a color rojo con el texto "Remove"
    And el ícono del carrito en la esquina superior derecha muestra un "1"

  @tc-02 
  Scenario: Remover un producto desde la página de inventario
    Given el usuario tiene el producto "Sauce Labs Backpack" en el carrito
    When el usuario hace clic en el botón "Remove" de dicho producto
    Then el botón cambia nuevamente a "Add to cart" verde
    And el contador numérico del carrito se oculta

  @tc-03
  Scenario Outline: Ordenar productos usando el filtro
    When el usuario selecciona la opción "<opcion_filtro>" en el menú desplegable superior derecho
    Then los productos se reordenan según el criterio "<criterio>"

    Examples:
      | opcion_filtro       | criterio                        |
      | Name (A to Z)       | Orden alfabético ascendente     |
      | Name (Z to A)       | Orden alfabético descendente    |
      | Price (low to high) | Del precio más bajo al más alto |
      | Price (high to low) | Del precio más alto al más bajo |
