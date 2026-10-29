CREATE TABLE users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100),
    Mobile VARCHAR(20),
    Gender VARCHAR(10),
    City VARCHAR(50),
    Address VARCHAR(200),
    Role VARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE donors (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NULL,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Mobile VARCHAR(20),
    BloodGroup VARCHAR(10),
    Weight INT NULL,
    LastDonationDate VARCHAR(50) NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(10),
    Image VARCHAR(200) NULL,
    Status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE blood_inventory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    BloodGroup VARCHAR(10),
    Units INT,
    LastUpdated DATETIME DEFAULT GETDATE()
);

CREATE TABLE blood_requests (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PatientName VARCHAR(100),
    BloodGroup VARCHAR(10),
    UnitsNeeded INT,
    HospitalName VARCHAR(150),
    ContactMobile VARCHAR(20),
    RequirementDate VARCHAR(50),
    Status VARCHAR(20) DEFAULT 'Pending',
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE camps (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CampName VARCHAR(150),
    Organizer VARCHAR(100),
    Location VARCHAR(200),
    CampDate VARCHAR(50),
    CampTime VARCHAR(50),
    ContactPerson VARCHAR(100),
    Mobile VARCHAR(20),
    Status VARCHAR(20) DEFAULT 'Upcoming'
);

CREATE TABLE appointments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DonorId INT NULL,
    DonorName VARCHAR(100),
    CampId INT NULL,
    CampName VARCHAR(150),
    AppointmentDate VARCHAR(50),
    TimeSlot VARCHAR(50),
    Status VARCHAR(20) DEFAULT 'Scheduled'
);

CREATE TABLE hospitals (
    Id INT PRIMARY KEY IDENTITY(1,1),
    HospitalName VARCHAR(150),
    City VARCHAR(50),
    Address VARCHAR(200),
    ContactPerson VARCHAR(100),
    Mobile VARCHAR(20)
);

CREATE TABLE feedback (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100),
    Message VARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);
