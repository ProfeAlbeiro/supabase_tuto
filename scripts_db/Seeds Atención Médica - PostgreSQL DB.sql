-- Insertar registros en la tabla Especialidades
INSERT INTO Especialidades (Nombre) VALUES
('Cardiolog�a'),
('Neurolog�a'),
('Pediatr�a'),
('Dermatolog�a');

-- Insertar registros en la tabla Hospitales
INSERT INTO Hospitales (Nombre, Direccion, NIT, Telefono) VALUES
('Hospital Central', 'Calle 123, Bogot�', '800123456-7', '1234567'),
('Cl�nica Norte', 'Avenida 45, Bogot�', '800765432-1', '7654321');

-- Insertar registros en la tabla Medicamentos
INSERT INTO Medicamentos (Nombre, Prescripcion, Cantidad, Unidades, Descripcion) VALUES
('Paracetamol', '500mg cada 8 horas', 100, 'Tabletas', 'Analg�sico y antipir�tico'),
('Ibuprofeno', '400mg cada 6 horas', 50, 'Tabletas', 'Antiinflamatorio no esteroideo'),
('Amoxicilina', '500mg cada 12 horas', 30, 'C�psulas', 'Antibi�tico de amplio espectro');

-- Insertar registros en la tabla Medicos
INSERT INTO Medicos (Nombre, Apellido, EspecialidadID, HospitalID, Telefono, CorreoElectronico) VALUES
('Juan', 'P�rez', 1, 1, '3001234567', 'juan.perez@hospitalcentral.com'),
('Ana', 'G�mez', 2, 2, '3007654321', 'ana.gomez@clinicanorte.com');

-- Insertar registros en la tabla Pacientes
INSERT INTO Pacientes (Nombre, Apellido, FechaNacimiento, Sexo, Direccion, Telefono, CorreoElectronico) VALUES
('Carlos', 'Mart�nez', '1985-05-15', 'M', 'Calle 10, Bogot�', '3101234567', 'carlos.martinez@gmail.com'),
('Mar�a', 'Rodr�guez', '1990-08-20', 'F', 'Carrera 20, Bogot�', '3107654321', 'maria.rodriguez@gmail.com');

-- Insertar registros en la tabla Visitas
INSERT INTO Visitas (PacienteID, MedicoID, Fecha, Hora) VALUES
(1, 1, '2025-03-01', '10:00'),
(2, 2, '2025-03-02', '11:00');

-- Insertar registros en la tabla MotivosVisitas
INSERT INTO MotivosVisitas (Descripcion) VALUES
('Dolor de cabeza'),
('Fiebre'),
('Dolor abdominal');

-- Insertar registros en la tabla DetallesVisitas
INSERT INTO DetallesVisitas (VisitaID, MotivoID, Diagnostico) VALUES
(1, 1, 'Migra�a'),
(2, 2, 'Infecci�n viral');

-- Insertar registros en la tabla SignosVitales
INSERT INTO SignosVitales (VisitaID, FrecuenciaCardiaca, PresionArterial, FrecuenciaRespiratoria, Temperatura, SaturacionOxigeno) VALUES
(1, 72, '120/80', 16, 36.5, 98.0),
(2, 80, '130/85', 18, 37.2, 97.5);

-- Insertar registros en la tabla Tratamientos
INSERT INTO Tratamientos (VisitaID, FechaInicio, FechaFin) VALUES
(1, '2025-03-01', '2025-03-10'),
(2, '2025-03-02', '2025-03-12');

-- Insertar registros en la tabla Formulas
INSERT INTO Formulas (TratamientoID, Fecha) VALUES
(1, '2025-03-01'),
(2, '2025-03-02');

-- Insertar registros en la tabla DetallesFormulas
INSERT INTO DetallesFormulas (FormulaID, MedicamentoID, Presentacion, Posologia, PeriodoUso, PeriodicidadUso) VALUES
(1, 1, 'Tabletas', '500mg cada 8 horas', '10 d�as', 'Cada 8 horas'),
(2, 2, 'Tabletas', '400mg cada 6 horas', '10 d�as', 'Cada 6 horas');

-- Insertar registros en la tabla Orden_Examenes
INSERT INTO Orden_Examenes (VisitaID, Fecha) VALUES
(1, '2025-03-01'),
(2, '2025-03-02');

-- Insertar registros en la tabla DetallesExamenes
INSERT INTO DetallesExamenes (OrdenExamenID, TipoExamen, NombreExamen, Indicaciones) VALUES
(1, 'Sangre', 'Hemograma completo', 'Ayuno de 8 horas'),
(2, 'Orina', 'Uroan�lisis', 'Recolectar muestra de la primera orina de la ma�ana');

-- Insertar registros en la tabla Incapacidades
INSERT INTO Incapacidades (Fecha, TratamientoID) VALUES
('2025-03-01', 1),
('2025-03-02', 2);

-- Insertar registros en la tabla DetallesIncapacidades
INSERT INTO DetallesIncapacidades (IncapacidadID, Descripcion, NumeroDias, FechaInicio, FechaFin) VALUES
(1, 'Reposo absoluto', 10, '2025-03-01', '2025-03-10'),
(2, 'Reposo relativo', 10, '2025-03-02', '2025-03-12');