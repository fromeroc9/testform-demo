@testcase @high
Feature: Módulo PIM (Gestión de Empleados)
  Como profesional de Recursos Humanos
  Quiero gestionar la información de los empleados
  Para mantener la base de datos de personal actualizada

  Background:
    * field project = OrangeHRM
    * field module = PIM
    Given el usuario ha iniciado sesión
    And navega a la sección "PIM"

  @tc-01
  Scenario: Agregar un nuevo empleado
    When el usuario hace clic en el botón "Add"
    And completa los campos "First Name", "Last Name" y "Employee Id"
    And hace clic en "Save"
    Then el sistema crea el registro del empleado
    And redirige a la vista de detalles personales del empleado

  @tc-02
  Scenario: Buscar un empleado por nombre
    When el usuario ingresa un nombre válido en el campo "Employee Name"
    And hace clic en el botón "Search"
    Then la tabla de resultados muestra al empleado correspondiente

  @tc-03
  Scenario: Eliminar un registro de empleado
    Given existe al menos un empleado en la lista
    When el usuario selecciona a un empleado haciendo clic en la casilla de verificación
    And hace clic en el botón de eliminar (icono de basurero)
    And confirma la eliminación en el diálogo modal
    Then el sistema muestra el mensaje "Successfully Deleted"
    And el empleado ya no aparece en la lista
