@testcase @high
Feature: Módulo Recruitment (Reclutamiento)
  Como reclutador
  Quiero gestionar vacantes y candidatos
  Para cubrir las posiciones abiertas en la empresa

  Background:
    * field project = OrangeHRM
    * field module = Recruitment
    Given el usuario ha iniciado sesión
    And navega a la sección "Recruitment"

  @tc-01
  Scenario: Crear una nueva vacante
    When el usuario navega a "Vacancies" y hace clic en "Add"
    And completa los datos de "Job Title", "Vacancy Name" y "Hiring Manager"
    And hace clic en "Save"
    Then la vacante se guarda y aparece en la lista de vacantes activas

  @tc-02
  Scenario: Agregar un candidato nuevo
    When el usuario navega a "Candidates" y hace clic en "Add"
    And completa los campos de nombre, apellido y correo
    And adjunta un currículum en formato PDF
    And hace clic en "Save"
    Then el candidato es registrado exitosamente en el sistema con el estado "Application Initiated"
