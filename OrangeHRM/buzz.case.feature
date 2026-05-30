Feature: Módulo Buzz (Red Social Corporativa)
  Como empleado
  Quiero poder interactuar en el muro de la empresa
  Para compartir novedades y reaccionar a publicaciones

  Background:
    Given el usuario ha iniciado sesión
    And navega a la sección "Buzz"

  Scenario: Publicar un estado en el muro
    When el usuario escribe "Hola a todos, esta es una prueba" en el cuadro de texto "Update Status"
    And hace clic en "Post"
    Then la publicación debe aparecer en el flujo de noticias recientes

  Scenario: Dar 'Me gusta' a una publicación
    Given existe al menos una publicación en el muro
    When el usuario hace clic en el ícono del corazón (Like) de una publicación
    Then el contador de "Likes" de la publicación debe incrementarse en uno
