@testcase
Feature: Solicitud de Préstamos (ParaBank)
  Como cliente del banco
  Quiero solicitar un préstamo
  Para obtener liquidez o financiamiento

  Background:
    * field type_of_test = funcional
    Given el usuario ha iniciado sesión en ParaBank

  @tc-01
  Scenario: Solicitar un préstamo exitosamente
    When el usuario hace clic en el enlace "Request Loan"
    And ingresa un monto de préstamo "1000.00" (Loan Amount)
    And ingresa un pago inicial "100.00" (Down Payment)
    And selecciona una cuenta desde donde se pagará (From account id)
    And hace clic en el botón "Apply Now"
    Then el sistema procesa la solicitud
    And muestra el estado de la solicitud como "Approved"
    And genera y muestra un nuevo número de cuenta para el préstamo

  @tc-02 @apply
  Scenario: Rechazo de préstamo por monto excesivo
    When el usuario hace clic en el enlace "Request Loan"
    And ingresa un monto de préstamo "9999999.00" con un pago inicial mínimo
    And hace clic en el botón "Apply Now"
    Then el sistema procesa la solicitud
    And muestra el estado de la solicitud como "Denied"
    And el sistema informa de insuficiencia de fondos
