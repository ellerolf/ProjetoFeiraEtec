unit UAcesso;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TFrmAcesso = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    EdtUsuario: TEdit;
    LblUsuario: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    espaço: TLabel;
    EdtSenha: TEdit;
    LblSenha: TLabel;
    espaço2: TLabel;
    RoundRect1: TRoundRect;
    BtnEntrar: TSpeedButton;
    Rectangle2: TRectangle;
    RoundRect2: TRoundRect;
    BtnVerSenha: TSpeedButton;
    procedure BtnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcesso: TFrmAcesso;

implementation

{$R *.fmx}

uses UMenu;

procedure TFrmAcesso.BtnEntrarClick(Sender: TObject);
begin
 if(EdtUsuario.Text='admin') and (EdtSenha.Text='1234') then
 begin
  FrmMenu.Show;

 end
 else
 begin
   ShowMessage('Usuario/Senha errada');
 end;

end;

end.
