unit UModulo;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TDM = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RDAluno: TRESTResponseDataSetAdapter;
    Aluno: TFDMemTable;
    RDControle: TRESTResponseDataSetAdapter;
    Controle: TFDMemTable;
    RDEixo: TRESTResponseDataSetAdapter;
    Eixo: TFDMemTable;
    RDNota: TRESTResponseDataSetAdapter;
    Nota: TFDMemTable;
    RDProjeto: TRESTResponseDataSetAdapter;
    Projeto: TFDMemTable;
    RDUsuario: TRESTResponseDataSetAdapter;
    Usuario: TFDMemTable;
    AlunoALUCODIGO: TIntegerField;
    AlunoALUNNOME: TStringField;
    AlunoCODIGOPRO: TIntegerField;
    ControleCONCODIGO: TIntegerField;
    ControleCODIGOUSU: TIntegerField;
    ControlePROJ1: TIntegerField;
    ControlePROJ2: TIntegerField;
    ControlePROJ3: TIntegerField;
    ControlePROJ4: TIntegerField;
    EixoEIXCODIGO: TIntegerField;
    EixoEIXONOME: TStringField;
    NotaNOTCODIGO: TIntegerField;
    NotaCODIGOALU: TIntegerField;
    NotaNOTAIND: TStringField;
    NotaNOTAGRP: TStringField;
    ProjetoPROCODIGO: TIntegerField;
    ProjetoPRONOME: TStringField;
    ProjetoCODIGOEIX: TIntegerField;
    UsuarioUSUCODIGO: TIntegerField;
    UsuarioUSUCPF: TStringField;
    UsuarioUSUNOME: TStringField;
    UsuarioUSUDTNASC: TDateField;
    UsuarioUSUTIPO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
