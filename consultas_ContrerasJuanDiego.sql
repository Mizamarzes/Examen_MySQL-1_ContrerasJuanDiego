-- ##########################
-- ###### EXAMEN MYSQL ########
-- ##########################
-- Consultas a la base de datos

-- 1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.
-- Esta consulta muestra todos los eventos que se tienen la id_complejo_deportivo = 3
SELECT 
	e.id_evento as Evento_ID,
    e.nombre as NombreEvento,
    ecd.id_complejo as Complejo_Deportivo_Asignado_ID
FROM eventos e
JOIN evento_complejo_deportivo ecd ON e.id_evento = ecd.id_evento
WHERE ecd.id_complejo = 3
ORDER BY e.id_evento;


-- 2. Consulta de Comisarios Asignados a un Evento en Particular.
-- Esta consulta muestra los comisarios asignados al evento de id_evento = 3
SELECT 
	c.id_comisario AS Comisario_ID,
	c.nombre AS NombreComisario,
    ec.id_evento AS Evento_Asignado_ID
FROM comisario c
JOIN evento_comisario ec ON c.id_comisario = ec.id_comisario
WHERE ec.id_evento= 3;


-- 3. Consulta de Todos los Eventos en un Rango de Fechas.
-- Esta consulta mostrara el Torneo de Tennis que se da en 2023-05-12 
-- que estaria dentro de los rangos
SELECT id_evento, nombre, fecha FROM eventos
WHERE fecha BETWEEN '2023-05-11' AND '2023-05-13';


-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.
-- Esta consulta cuenta el numero de comisarios que estan registrados en la tabla
-- evento_comisario
SELECT COUNT(id_comisario) as Numero_de_comisarios FROM evento_comisario
WHERE id_evento IS NOT NULL;


-- 5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a 
-- un Valor Específico.
-- Esta consulta muestra los complejos Polideportivos con area total a 64
SELECT       
	i.id_complejo AS complejo_ID,
    c.nombre AS nameComplejoPolideportivo,
    i.area_complejo AS Area_Total
FROM complejo_deportivo c
JOIN info_complejo i ON c.id_info_complejo = i.id_complejo
WHERE i.area_complejo>64
ORDER BY i.area_complejo ASC;

-- Por ejemplo el complejo bogota es deportivo entonces por siemplemente muestra solo
-- el complejo zapatoca

-- Por lo que pude analizar el complejo bogota no existe no hace parte ni de la tablas
-- complejos deportivo ni polideportivo

SELECT * FROM complejo_deportivo;
SELECT * FROM complejo_polideportivo;
SELECT * FROM info_complejo;


-- 6. Consulta de Eventos con Número de Participantes Mayor que la Media.
-- Esta consulta muestra los eventos que son mayores al promedio de participantes que es 50
SELECT nombre, num_participantes FROM eventos
WHERE num_participantes > 50;

SELECT num_participantes FROM eventos;
SELECT AVG(num_participantes) FROM eventos;

-- 7. Consulta de Equipamiento Necesario para un Evento Específico.
-- Esta consulta muestra el equipamiento para el evento de ID = 3
SELECT 
	ee.id_evento as Evento_ID,
    e.id_equipamiento as Equipo_ID,
    e.nombre_equipos as Nombre_Equipamiento
FROM evento_equipo ee
JOIN equipamiento e ON ee.id_equipamiento = e.id_equipamiento
WHERE ee.id_evento=3;

SELECT * FROM evento_equipo;
SELECT * FROM equipamiento;


-- 8. Consulta de Eventos Celebrados en Complejos Deportivos 
-- con Jefe de Organización Específico.
-- Esta consulta halla los eventos celebrados en complejos por Jefe = 'Jose Hernandez'
SELECT 
	e.id_evento AS Evento_ID,
    e.nombre AS NombreEvento,
    ed.nombre AS Nombre_Complejo_Deportivo,
    j.nombre AS Nombre_Jefe_Organizacion
FROM eventos e
JOIN evento_complejo_deportivo ecd ON e.id_evento = ecd.id_evento
JOIN complejo_deportivo ed ON ed.id_complejo_deportivo = ecd.id_evento
JOIN info_complejo ic ON ic.id_complejo = ed.id_complejo_deportivo
JOIN jefes j ON j.id_jefe = ic.id_jefe
WHERE j.nombre ='Jose Hernandez';

SELECT * FROM jefes;

-- 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.
-- Esta consulta

SELECT
	e.id_complejo as complejoPolideportivo_ID
FROM eventos_complejo_poli ecp
JOIN eventos e ON e.id_evento = ecp_id_evento
WHERE id_evento IS NULL;

SELECT * FROM complejo_polideportivo;
SELECT * FROM evento_complejo_poli;



-- 10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
-- Esta consulta  muestra los comisarios que estan en eventos como = 'Juez'
SELECT 
	c.id_comisario as comisario_ID,
    c.nombre as NombreComisario,
    c.tipo as Tipo,
    e.id_evento as evento_ID
FROM comisario c
INNER JOIN evento_comisario e ON c.id_comisario = e.id_comisario
WHERE c.tipo ='Juez';

SELECT * FROM evento_comisario;
SELECT * FROM comisario;

-- Developed by Juan Diego Contreras Melendez, CC 1097*******782








