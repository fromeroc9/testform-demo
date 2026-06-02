@testcase
Feature: Módulo de Login (SauceDemo)
  Como usuario de la tienda
  Quiero autenticarme en el sistema
  Para poder acceder a los productos y comprar

  Background:
    * field type_of_test = funcional
    Given el usuario se encuentra en la página de login "https://www.saucedemo.com"

  @tc-01 @apply
  Scenario: Iniciar sesión exitosamente con usuario estándar
    When el usuario ingresa el nombre de usuario "standard_user"
    And ingresa la contraseña "secret_sauce"
    And hace clic en el botón "Login"
    Then el sistema lo redirige a la página de inventario "Products"

  @tc-02
  Scenario: Iniciar sesión con un usuario bloqueado
    When el usuario ingresa el nombre de usuario "locked_out_user"
    And ingresa la contraseña "secret_sauce"
    And hace clic en el botón "Login"
    Then el sistema muestra el mensaje de error "Epic sadface: Sorry, this user has been locked out."

  @tc-03 @apply
  Scenario: Error al iniciar sesión sin credenciales
    When el usuario hace clic en el botón "Login" sin ingresar datos
    Then el sistema muestra el mensaje de error "Epic sadface: Username is required"
