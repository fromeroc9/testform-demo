@testcase @low
Feature: Catálogo y Búsqueda (Magento / Luma)
  Como comprador de la tienda
  Quiero navegar por las categorías de ropa y buscar productos
  Para encontrar artículos específicos fácilmente

  Background:
    * field type_of_test = funcional
    * field project = Magento
    Given el usuario está en la página principal de la tienda

  @tc-01 
  Scenario: Filtrar productos por atributos (Tamaño y Color)
    When el usuario navega por el menú superior a "Men" > "Tops" > "Jackets"
    And despliega el filtro "Size" en la barra lateral y escoge la talla "L"
    And despliega el filtro "Color" en la barra lateral y escoge "Black"
    Then la lista de productos se actualiza automáticamente
    And solo se muestran chaquetas que estén disponibles en color negro y talla L

  @tc-02
  Scenario: Búsqueda de productos desde la barra de búsqueda general
    When el usuario escribe la palabra clave "Yoga" en la barra de búsqueda superior
    And presiona la tecla Enter o hace clic en el ícono de la lupa
    Then el sistema lo redirige a la página "Search results for: 'Yoga'"
    And se muestran productos relacionados como leggings de yoga, mats o tops
