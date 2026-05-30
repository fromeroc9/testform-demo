Feature: Servicios de Cuentas (ParaBank)
  Como cliente del banco
  Quiero gestionar mis cuentas
  Para ver mis balances y abrir nuevas cuentas

  Background:
    Given el usuario ha iniciado sesión en ParaBank

  Scenario: Abrir una nueva cuenta bancaria
    When el usuario hace clic en el enlace "Open New Account"
    And selecciona el tipo de cuenta "SAVINGS"
    And selecciona una cuenta existente para transferir los fondos iniciales
    And hace clic en el botón "Open New Account"
    Then el sistema muestra el mensaje "Account Opened!"
    And genera un nuevo número de cuenta válido

  Scenario: Visualizar el resumen de las cuentas (Accounts Overview)
    When el usuario hace clic en el enlace "Accounts Overview"
    Then el sistema muestra una tabla con todas las cuentas del cliente
    And se visualiza el saldo ("Balance") y los fondos disponibles ("Available Amount") para cada cuenta
    And el total global de los saldos se muestra en la fila inferior "Total"
