--PostgreSQL

-- Crear tabla Especialidades
CREATE TABLE Especialidades (
    EspecialidadID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Crear tabla Hospitales
CREATE TABLE Hospitales (
    HospitalID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    NIT VARCHAR(20) NOT NULL,
    Telefono VARCHAR(15) NOT NULL
);

-- Crear tabla Medicamentos
CREATE TABLE Medicamentos (
    MedicamentoID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Prescripcion VARCHAR(200) NOT NULL,
    Cantidad INT NOT NULL,
    Unidades VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(500)
);

-- Crear tabla Medicos
CREATE TABLE Medicos (
    MedicoID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    EspecialidadID INT NOT NULL REFERENCES Especialidades(EspecialidadID),
    HospitalID INT NOT NULL REFERENCES Hospitales(HospitalID),
    Telefono VARCHAR(15) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL
);

-- Crear tabla Pacientes
CREATE TABLE Pacientes (
    PacienteID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL
);

-- Crear tabla Visitas
CREATE TABLE Visitas (
    VisitaID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    PacienteID INT NOT NULL REFERENCES Pacientes(PacienteID),
    MedicoID INT NOT NULL REFERENCES Medicos(MedicoID),
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL
);

-- Crear tabla MotivosVisitas
CREATE TABLE MotivosVisitas (
    MotivoID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Descripcion VARCHAR(500) NOT NULL
);

-- Crear tabla DetallesVisitas
CREATE TABLE DetallesVisitas (
    DetalleVisitaID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VisitaID INT NOT NULL REFERENCES Visitas(VisitaID),
    MotivoID INT NOT NULL REFERENCES MotivosVisitas(MotivoID),
    Diagnostico VARCHAR(500) NOT NULL
);

-- Crear tabla SignosVitales
CREATE TABLE SignosVitales (
    SignoVitalID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VisitaID INT NOT NULL REFERENCES Visitas(VisitaID),
    FrecuenciaCardiaca INT NOT NULL,
    PresionArterial VARCHAR(20) NOT NULL,
    FrecuenciaRespiratoria INT NOT NULL,
    Temperatura DECIMAL(4, 1) NOT NULL,
    SaturacionOxigeno DECIMAL(4, 1) NOT NULL
);

-- Crear tabla Tratamientos
CREATE TABLE Tratamientos (
    TratamientoID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VisitaID INT NOT NULL REFERENCES Visitas(VisitaID),
    FechaInicio DATE NOT NULL,
    FechaFin DATE
);

-- Crear tabla Formulas
CREATE TABLE Formulas (
    FormulaID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TratamientoID INT NOT NULL REFERENCES Tratamientos(TratamientoID),
    Fecha DATE NOT NULL
);

-- Crear tabla DetallesFormulas
CREATE TABLE DetallesFormulas (
    DetalleID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FormulaID INT NOT NULL REFERENCES Formulas(FormulaID),
    MedicamentoID INT NOT NULL REFERENCES Medicamentos(MedicamentoID),
    Presentacion VARCHAR(100) NOT NULL,
    Posologia VARCHAR(200) NOT NULL,
    PeriodoUso VARCHAR(100) NOT NULL,
    PeriodicidadUso VARCHAR(100) NOT NULL
);

-- Crear tabla Orden_Examenes
CREATE TABLE Orden_Examenes (
    OrdenExamenID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VisitaID INT NOT NULL REFERENCES Visitas(VisitaID),
    Fecha DATE NOT NULL
);

-- Crear tabla DetallesExamenes
CREATE TABLE DetallesExamenes (
    DetalleExamenID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrdenExamenID INT NOT NULL REFERENCES Orden_Examenes(OrdenExamenID),
    TipoExamen VARCHAR(100) NOT NULL,
    NombreExamen VARCHAR(100) NOT NULL,
    Indicaciones VARCHAR(500)
);

-- Crear tabla Incapacidades
CREATE TABLE Incapacidades (
    IncapacidadID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Fecha DATE NOT NULL,
    TratamientoID INT NOT NULL REFERENCES Tratamientos(TratamientoID)
);

-- Crear tabla DetallesIncapacidades
CREATE TABLE DetallesIncapacidades (
    DetalleID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IncapacidadID INT NOT NULL REFERENCES Incapacidades(IncapacidadID),
    Descripcion VARCHAR(500) NOT NULL,
    NumeroDias INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);