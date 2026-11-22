@bug
Feature: testcycle/Magento-20260612_120000_6be4l9.run.feature

  Background:
    * field project = Magento

  @bg-1
  Scenario: Defecto no especificado
    * set target = Magento/catalog.case.feature.@tc-02
    * set status = open

  @bg-2
  Scenario: Nuevo defecto
    * set target = Magento/catalog.case.feature.@tc-02
    * set status = open
