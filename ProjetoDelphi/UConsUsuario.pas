unit UConsUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmConsUsuario = class(TForm)
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
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
  FrmConsUsuario: TFrmConsUsuario;

implementation

{$R *.fmx}

end.
