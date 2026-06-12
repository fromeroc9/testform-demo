@testcase @high
Feature: Gestión de Clientes (Magento / Luma)
  Como cliente de la tienda Magento
  Quiero registrarme y acceder a mi cuenta
  Para poder comprar más rápidamente y revisar mis pedidos en el futuro

  Background:
    * field project = Magento
    * field module = Customer
    Given el usuario se encuentra en la página de inicio de la tienda Magento Luma

  @tc-01
  Scenario: Crear una nueva cuenta de cliente exitosamente
    When el usuario hace clic en el enlace superior "Create an Account"
    And completa los campos de "Personal Information" (First Name, Last Name)
    And completa los campos de "Sign-in Information" (Email, Password, Confirm Password)
    And hace clic en el botón "Create an Account"
    Then el sistema lo redirige al panel "My Account"
    And muestra el mensaje de éxito "Thank you for registering with Main Website Store."

  @tc-02
  Scenario: Iniciar sesión con una cuenta existente
    When el usuario hace clic en el enlace superior "Sign In"
    And ingresa su email registrado y contraseña en la página de Login
    And hace clic en el botón "Sign In"
    Then el sistema lo autentica correctamente
    And muestra el mensaje "Welcome, [Nombre del Usuario]!" en el encabezado de la página
