@bug
Feature: testcycle/SauceDemo-20260612_120002.run.feature

  Background:
    * field priority = @medium
    * field Status = Done
    * field assignees = fromeroc9
    * field project = SauceDemo

  @bg-01
  Scenario: No carga el carrito
    * set target = testcase/SauceDemo/products.case.feature.@tc-01
    * set status = in_progress
    * set trace = Hola Mundo.
    * set attach = attachments/bugs/bg-1_1794601845303.png
    * set severity = @major
    * set bug_type = functional
