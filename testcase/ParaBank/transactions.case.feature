@testcase
Feature: Transferencias y Pagos (ParaBank)
  Como cliente del banco
  Quiero transferir fondos y pagar servicios
  Para manejar mis finanzas personales

  Background:
    * field project = ParaBank
    * field module = ProduTransactions
    Given el usuario ha iniciado sesión en ParaBank
    And posee al menos dos cuentas con fondos disponibles

  @tc-01
  Scenario: Transferir fondos entre cuentas
    When el usuario hace clic en el enlace "Transfer Funds"
    And ingresa el monto a transferir "100.00"
    And selecciona la cuenta de origen "From account"
    And selecciona la cuenta de destino "To account"
    And hace clic en el botón "Transfer"
    Then el sistema muestra el mensaje "Transfer Complete!"
    And el monto "100.00" es reflejado en los detalles de la transacción

  @tc-02
  Scenario: Realizar un pago de servicios (Bill Pay)
    When el usuario hace clic en el enlace "Bill Pay"
    And completa los datos del beneficiario "Payee Information" (Nombre, Dirección, Número de Cuenta)
    And ingresa el monto "50.00"
    And selecciona la cuenta desde la cual se pagará
    And hace clic en el botón "Send Payment"
    Then el sistema muestra el mensaje "Bill Payment Complete"
    And confirma que el pago de "50.00" fue enviado correctamente al beneficiario
