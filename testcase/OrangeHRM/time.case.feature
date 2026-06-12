@testcase @high
Feature: Módulo Time (Control de Tiempo)
  Como empleado
  Quiero registrar mis horas de trabajo
  Para generar mis hojas de tiempo (Timesheets)

  Background:
    * field project = OrangeHRM
    * field module = Time
    Given el usuario ha iniciado sesión
    And navega a la sección "Time"

  @tc-01
  Scenario: Realizar "Punch In" (Registro de entrada)
    When el usuario navega a "Attendance" y selecciona "Punch In/Out"
    And ingresa una nota opcional
    And hace clic en "In"
    Then el sistema registra la hora actual de entrada
    And el estado cambia a "Punched In"

  @tc-02
  Scenario: Crear y enviar una hoja de tiempo (Timesheet)
    When el usuario navega a "Timesheets" -> "My Timesheets"
    And selecciona una semana
    And agrega las horas trabajadas por proyecto y actividad
    And hace clic en "Submit"
    Then el estado de la hoja de tiempo cambia a "Submitted"
