unit UAtribuicao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.StdCtrls, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmAtribuicao = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect1: TRoundRect;
    ListView1: TListView;
    ListView2: TListView;
    PnlProj1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LblProj1: TLabel;
    Label4: TLabel;
    LblProfessor1: TLabel;
    LblProjeto1: TLabel;
    Label7: TLabel;
    PnlProj2: TPanel;
    LblProj2: TLabel;
    Label8: TLabel;
    LblProfessor2: TLabel;
    LblProjeto2: TLabel;
    Label11: TLabel;
    PnlProj3: TPanel;
    LblProj3: TLabel;
    Label13: TLabel;
    LblProfessor3: TLabel;
    LblProjeto3: TLabel;
    Label16: TLabel;
    PnlProj4: TPanel;
    LblProj4: TLabel;
    Label18: TLabel;
    LblProfessor4: TLabel;
    LblProjeto4: TLabel;
    Label21: TLabel;
    Layout5: TLayout;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    BtnAdd1: TSpeedButton;
    Image2: TImage;
    BtnAdd2: TSpeedButton;
    Image3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtribuicao: TFrmAtribuicao;

implementation

{$R *.fmx}

end.
