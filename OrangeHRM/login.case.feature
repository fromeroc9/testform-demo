@testcase
Feature: Inicio de sesión en OrangeHRM
  Como usuario del sistema OrangeHRM
  Quiero poder iniciar sesión con mis credenciales
  Para acceder al panel principal y gestionar mis tareas

  Background:
    Given el usuario se encuentra en la página de login de OrangeHRM

  Scenario: Inicio de sesión exitoso con credenciales válidas
    When el usuario ingresa el nombre de usuario "Admin"
    And el usuario ingresa la contraseña "admin123"
    And hace clic en el botón de "Login"
    Then el sistema redirige al usuario al panel principal (Dashboard)

  Scenario Outline: Inicio de sesión fallido por credenciales incorrectas
    When el usuario ingresa el nombre de usuario "<usuario>"
    And el usuario ingresa la contraseña "<contrasena>"
    And hace clic en el botón de "Login"
    Then el sistema deniega el acceso
    And muestra el mensaje de error "Invalid credentials"

    Examples:
      | usuario   | contrasena |
      | Admin     | claveFalsa |
      | no_existe | admin123   |
      | no_existe | claveFalsa |

  Scenario Outline: Intento de inicio de sesión con campos requeridos vacíos
    When el usuario ingresa el nombre de usuario "<usuario>"
    And el usuario ingresa la contraseña "<contrasena>"
    And hace clic en el botón de "Login"
    Then el sistema no realiza la petición de inicio de sesión
    And muestra el mensaje de validación "Required" debajo del campo omitido

    Examples:
      | usuario | contrasena |
      |         |            |
      | Admin   |            |
      |         | admin123   |

  Scenario: Redirección para recuperar contraseña
    When el usuario hace clic en el enlace "Forgot your password?"
    Then el sistema redirige al usuario a la vista de recuperación de contraseña

  Scenario: Redirección al sitio oficial de OrangeHRM
    When el usuario hace clic en el enlace "OrangeHRM, Inc" del pie de página
    Then se abre una nueva pestaña redirigiendo al sitio oficial de OrangeHRM
