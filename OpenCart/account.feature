Feature: Cuenta de Usuario (OpenCart)
  Como usuario de la tienda OpenCart
  Quiero registrarme y acceder a mi cuenta
  Para gestionar mi información y realizar pedidos

  Background:
    Given el usuario navega a "https://demo.opencart.com/index.php?route=account/login"

  Scenario: Iniciar sesión exitosamente
    When el usuario ingresa su correo en el campo "E-Mail Address"
    And ingresa su contraseña en el campo "Password"
    And hace clic en el botón "Login"
    Then el sistema redirige a la página "My Account"

  Scenario: Error de inicio de sesión por credenciales incorrectas
    When el usuario ingresa credenciales inválidas
    And hace clic en "Login"
    Then el sistema muestra el mensaje de alerta "Warning: No match for E-Mail Address and/or Password."

  Scenario: Registrar una nueva cuenta
    When el usuario hace clic en el botón "Continue" bajo la sección "New Customer"
    And completa el formulario "Register Account" con datos personales y contraseña
    And acepta la Política de Privacidad (Privacy Policy)
    And hace clic en el botón "Continue"
    Then el sistema muestra la pantalla "Your Account Has Been Created!"
