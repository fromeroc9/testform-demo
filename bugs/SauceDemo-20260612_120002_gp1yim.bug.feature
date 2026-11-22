@bug @medium
Feature: Defectos encontrados en SauceDemo-20260612_120002_gp1yim

  Background:
    * set run = testcycle/SauceDemo-20260612_120002_gp1yim.run.feature
    * field Status = Done
    * field assignees = fromeroc9
    * field project = SauceDemo

  Rule: SauceDemo/products.case.feature

    @bg-01 @depends_on(@tc-01)
    Scenario: No carga el carrito
      * set status = in_progress
      * set trace = Hola Mundo.
      * set attach = attachments/bugs/bg-1_1794601845303.png
      * field severity = @major
      * field bug_type = functional
