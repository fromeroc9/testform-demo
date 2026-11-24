@bug @medium
Feature: Defectos encontrados en SauceDemo-20260612_120002_gp1yim

  Background:
    * set run = testcycle/SauceDemo-20260612_120002_gp1yim.run.feature
    * field assignees = fromeroc9
    * field project = SauceDemo

  Rule: SauceDemo/products.case.feature

    @bg-01 @depends_on(@tc-01)
    Scenario: No carga los productos del carrito
      Given usuario inicia sesión en la aplicación
      When usuario agrega un producto al carrito
      Then usuario no puede ver los productos en el carrito
      * set status = in_progress
      * set trace = Hola Mundo.
      * set attach = bg-1_1794601845303.png