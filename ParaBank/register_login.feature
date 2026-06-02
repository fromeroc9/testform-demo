@testcase
Feature: Registro y Autenticación (ParaBank)
  Como usuario del banco
  Quiero registrarme e iniciar sesión
  Para acceder a mis servicios financieros y cuentas

  Background:
    * field type_of_test = funcional
    Given el usuario se encuentra en la página de inicio "https://parabank.parasoft.com/"

  @tc-01
  Scenario: Registrar un nuevo usuario exitosamente
    When el usuario hace clic en el enlace "Register"
    And completa el formulario de registro con datos válidos (nombre, dirección, SSN, usuario y contraseña)
    And hace clic en el botón "Register"
    Then el sistema muestra el mensaje "Your account was created successfully. You are now logged in."

  @tc-02
  Scenario: Iniciar sesión con credenciales válidas
    Given el usuario ya tiene una cuenta registrada
    When ingresa su nombre de usuario y contraseña en el panel "Customer Login"
    And hace clic en el botón "Log In"
    Then el sistema lo redirige a la página "Accounts Overview"
    And muestra el mensaje de bienvenida con su nombre

  @tc-03
  Scenario: Error al iniciar sesión con credenciales inválidas
    When ingresa un usuario inválido y una contraseña incorrecta en el panel "Customer Login"
    And hace clic en el botón "Log In"
    Then el sistema muestra un mensaje de error "The username and password could not be verified."
