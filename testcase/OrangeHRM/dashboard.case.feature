@testcase @high
Feature: Módulo Dashboard (Panel Principal)
  Como usuario del sistema
  Quiero ver el panel principal
  Para acceder rápidamente a mis métricas y accesos directos

  Background:
    * field project = OrangeHRM
    * field module = Dashboard
    Given el usuario ha iniciado sesión exitosamente
    And es redirigido a la pantalla principal "Dashboard"

  @tc-01
  Scenario: Verificar la visibilidad de todos los widgets principales
    When Se visualiza el Dashboard
    Then el usuario debe ver los siguientes widgets en el panel:
      | Widget Name                       |
      | Time at Work                      |
      | My Actions                        |
      | Quick Launch                      |
      | Buzz Latest Posts                 |
      | Employees on Leave Today          |
      | Employee Distribution by Sub Unit |

  @tc-02
  Scenario Outline: Acceso rápido mediante los iconos de Quick Launch
    When el usuario hace clic en el ícono "<icono>" dentro del widget "Quick Launch"
    Then el sistema redirige a la pantalla correspondiente

    Examples:
      | icono        |
      | Assign Leave |
      | Leave List   |
      | Timesheets   |
      | Apply Leave  |
      | My Leave     |
      | My Timesheet |
