unit UCadEixo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmCadEixo = class(TForm)
    Layout1: TLayout;
    EdtNome: TEdit;
    Label2: TLabel;
    RoundRect1: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    Layout2: TLayout;
    RoundRect2: TRoundRect;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEixo: TFrmCadEixo;

implementation

{$R *.fmx}

end.
