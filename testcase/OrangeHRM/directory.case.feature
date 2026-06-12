@testcase @high
Feature: Módulo Directory (Directorio)
  Como empleado
  Quiero buscar información de otros colegas
  Para facilitar la comunicación interna

  Background:
    * field project = OrangeHRM
    * field module = Directory
    Given el usuario ha iniciado sesión
    And navega a la sección "Directory"

  @tc-01
  Scenario: Búsqueda exitosa de un empleado
    When el usuario ingresa un nombre en "Employee Name"
    And hace clic en "Search"
    Then se muestran las tarjetas o resultados del empleado correspondiente con su Job Title y Location

  @tc-02
  Scenario: Filtrar por puesto de trabajo (Job Title)
    When el usuario selecciona un puesto específico en el menú desplegable "Job Title"
    And hace clic en "Search"
    Then se muestran todos los empleados que tienen asignado ese puesto
