-- CREATE DATABASE CadastroFinanceiro;
USE CadastroFinanceiro;

CREATE TABLE Cliente (
ClienteID	INT				PRIMARY KEY IDENTITY(1,1),
Nome		VARCHAR(200)	NOT NULL,
CPF			CHAR(11)		NOT NULL,
UF			CHAR(2),
Celular		VARCHAR(13)	
);

CREATE TABLE TipoFinanciamento (
TipoFinanciamentoID	INT	PRIMARY KEY IDENTITY(1,1),
Descricao			VARCHAR(200) NOT NULL
);

CREATE TABLE Financiamento (
FinanciamentoID		INT	PRIMARY KEY IDENTITY(1,1),
CPF					CHAR(11) NOT NULL,
ValorTotal			DECIMAL(12,2) NOT NULL,
DataUltimoVencimento DATETIME NOT NULL,
TipoFinanciamentoID	INT	NOT NULL,
ClienteID			INT	NOT NULL,

CONSTRAINT FK_TipoFinanciamento FOREIGN KEY (TipoFinanciamentoID) REFERENCES TipoFinanciamento(TipoFinanciamentoID),
CONSTRAINT FK_Cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
);

CREATE TABLE Parcela (
ParcelaID		INT	PRIMARY KEY IDENTITY(1,1),
NumeroOrdem		INT	NOT NULL,
Valor			DECIMAL(12,2) NOT NULL,
DataVencimento	DATETIME NOT NULL,
DataPagamento	DATETIME,
FinanciamentoID	INT NOT NULL

CONSTRAINT FK_Financiamento FOREIGN KEY (FinanciamentoID) REFERENCES Financiamento(FinanciamentoID)
);
