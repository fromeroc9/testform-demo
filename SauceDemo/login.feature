Feature: Módulo de Login (SauceDemo)
  Como usuario de la tienda
  Quiero autenticarme en el sistema
  Para poder acceder a los productos y comprar

  Background:
    Given el usuario se encuentra en la página de login "https://www.saucedemo.com"

  Scenario: Iniciar sesión exitosamente con usuario estándar
    When el usuario ingresa el nombre de usuario "standard_user"
    And ingresa la contraseña "secret_sauce"
    And hace clic en el botón "Login"
    Then el sistema lo redirige a la página de inventario "Products"

  Scenario: Iniciar sesión con un usuario bloqueado
    When el usuario ingresa el nombre de usuario "locked_out_user"
    And ingresa la contraseña "secret_sauce"
    And hace clic en el botón "Login"
    Then el sistema muestra el mensaje de error "Epic sadface: Sorry, this user has been locked out."

  Scenario: Error al iniciar sesión sin credenciales
    When el usuario hace clic en el botón "Login" sin ingresar datos
    Then el sistema muestra el mensaje de error "Epic sadface: Username is required"
