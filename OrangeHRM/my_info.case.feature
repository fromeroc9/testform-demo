Feature: Módulo My Info (Mi Información)
  Como empleado
  Quiero poder ver y actualizar mis datos personales
  Para mantener mi información de contacto al día

  Background:
    Given el usuario ha iniciado sesión
    And navega a la sección "My Info"

  Scenario: Actualizar información de contacto
    When el usuario selecciona la sección "Contact Details"
    And actualiza el campo de "Street 1" y "Mobile"
    And hace clic en "Save"
    Then el sistema guarda los cambios y muestra un mensaje de éxito

  Scenario: Agregar contacto de emergencia
    When el usuario selecciona la sección "Emergency Contacts"
    And hace clic en "Add"
    And ingresa el nombre y teléfono del contacto
    And hace clic en "Save"
    Then el contacto de emergencia aparece listado correctamente
