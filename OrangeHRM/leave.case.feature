@testcase @high
Feature: Módulo Leave (Gestión de Ausencias/Vacaciones)
  Como empleado y como administrador
  Quiero solicitar y gestionar permisos
  Para llevar un control adecuado de mis ausencias y las de mi equipo

  Background:
    * field type_of_test = funcional
    * field project = OrangeHRM
    Given el usuario ha iniciado sesión
    And navega a la sección "Leave"

  @tc-01
  Scenario: Solicitar un permiso con días disponibles
    When el usuario navega a la pestaña "Apply"
    And selecciona un "Leave Type" válido
    And selecciona fechas de inicio y fin válidas
    And hace clic en "Apply"
    Then el sistema muestra un mensaje de "Successfully Applied"
    And la solicitud aparece en "My Leave" con estado pendiente

  @tc-02
  Scenario: Asignar permisos desde el rol de administrador
    Given el usuario tiene permisos de administrador o HR
    When navega a la pestaña "Assign Leave"
    And selecciona un empleado, tipo de permiso y fechas
    And hace clic en "Assign"
    Then el sistema descuenta los días del balance del empleado
    And el permiso se registra exitosamente

  @tc-03
  Scenario: Aprobar una solicitud de permiso pendiente
    Given el usuario es supervisor o administrador
    When navega a la pestaña "Leave List"
    And busca las solicitudes con estado "Pending Approval"
    And selecciona la acción "Approve" para una solicitud
    And hace clic en "Save"
    Then el estado de la solicitud cambia a "Scheduled" o "Taken"
