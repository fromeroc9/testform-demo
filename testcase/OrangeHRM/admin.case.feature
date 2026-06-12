@testcase @high
Feature: Módulo Admin (Administración)
  Como administrador del sistema
  Quiero gestionar los usuarios y la configuración de la organización
  Para mantener el control y seguridad del sistema

  Background:
    * field project = OrangeHRM
    * field module = Admin
    Given el usuario ha iniciado sesión como Administrador
    And navega a la sección "Admin"

  @tc-01
  Scenario: Buscar un usuario existente por nombre de usuario
    When el usuario ingresa un nombre de usuario válido en el campo "Username"
    And hace clic en el botón "Search"
    Then el sistema muestra los detalles del usuario en la tabla "System Users"

  @tc-02
  Scenario Outline: Buscar y filtrar usuarios por Rol y Estado
    When el usuario selecciona el rol "<rol>" en el menú "User Role"
    And selecciona el estado "<estado>" en el menú "Status"
    And hace clic en el botón "Search"
    Then la tabla muestra únicamente los usuarios que coinciden con los filtros

    Examples:
      | rol   | estado   |
      | Admin | Enabled  |
      | ESS   | Disabled |

  @tc-03
  Scenario: Limpiar filtros de búsqueda
    When el usuario ingresa "Admin" en el campo "Username"
    And hace clic en el botón "Reset"
    Then los campos de búsqueda se vacían a sus valores por defecto

  @tc-04
  Scenario: Agregar un nuevo usuario del sistema
    When el usuario hace clic en el botón verde "+ Add"
    And completa los datos requeridos (User Role, Employee Name, Status, Username, Password)
    And hace clic en "Save"
    Then el sistema guarda al usuario y aparece en la tabla de System Users
