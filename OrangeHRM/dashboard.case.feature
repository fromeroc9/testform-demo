Feature: Módulo Dashboard (Panel Principal)
  Como usuario del sistema
  Quiero ver el panel principal
  Para acceder rápidamente a mis métricas y accesos directos

  Background:
    Given el usuario ha iniciado sesión exitosamente
    And es redirigido a la pantalla principal "Dashboard"

  Scenario: Verificar la visibilidad de todos los widgets principales
    Then el usuario debe ver los siguientes widgets en el panel:
      | Widget Name                         |
      | Time at Work                        |
      | My Actions                          |
      | Quick Launch                        |
      | Buzz Latest Posts                   |
      | Employees on Leave Today            |
      | Employee Distribution by Sub Unit   |

  Scenario Outline: Acceso rápido mediante los iconos de Quick Launch
    When el usuario hace clic en el ícono "<icono>" dentro del widget "Quick Launch"
    Then el sistema redirige a la pantalla correspondiente
    
    Examples:
      | icono          |
      | Assign Leave   |
      | Leave List     |
      | Timesheets     |
      | Apply Leave    |
      | My Leave       |
      | My Timesheet   |
