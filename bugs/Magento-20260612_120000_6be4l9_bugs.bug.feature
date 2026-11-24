@bug
Feature: Defectos encontrados en Magento

  Background:
    * set run = testcycle/Magento-20260612_120000_6be4l9.run.feature
    * field project = Magento

  Rule: Magento/catalog.case.feature

    @bg-1 @depends_on(@tc-02)
    Scenario: Defecto no especificado
      * set status = open

    @bg-2 @tc-02
    Scenario: Nuevo defecto
      * set status = open
