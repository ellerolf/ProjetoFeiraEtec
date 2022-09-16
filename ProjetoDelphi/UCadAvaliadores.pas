unit UCadAvaliadores;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TFrmCadAvaliadores = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    EdtCpf: TEdit;
    EdtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtData: TDateEdit;
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
  FrmCadAvaliadores: TFrmCadAvaliadores;

implementation

{$R *.fmx}

end.
