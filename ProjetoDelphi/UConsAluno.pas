unit UConsAluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmConsAluno = class(TForm)
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect3: TRoundRect;
    BtnAlterar: TSpeedButton;
    Image2: TImage;
    ListView1: TListView;
    RoundRect4: TRoundRect;
    BtnExcluir: TSpeedButton;
    Image3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsAluno: TFrmConsAluno;

implementation

{$R *.fmx}

end.
