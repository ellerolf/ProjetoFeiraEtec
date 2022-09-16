unit UCadUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TFrmCadUsuario = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    EdtCpf: TEdit;
    EdtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtData: TDateEdit;
    Label4: TLabel;
    CboTipo: TComboBox;
    RoundRect1: TRoundRect;
    BtnSalvar: TSpeedButton;
    Image1: TImage;
    Layout2: TLayout;
    Label5: TLabel;
    RoundRect2: TRoundRect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.fmx}

end.
