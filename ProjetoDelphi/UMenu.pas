unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TreeView,
  FMX.Layouts, FMX.Menus, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.Objects;

type
  TFrmMenu = class(TForm)
    LayLateral: TLayout;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    RoundRect3: TRoundRect;
    LayEsquerda: TLayout;
    LayUsuario: TLayout;
    LayProjeto: TLayout;
    LayRelatorio: TLayout;
    RoundRect4: TRoundRect;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RoundRect6: TRoundRect;
    RoundRect8: TRoundRect;
    RoundRect9: TRoundRect;
    RoundRect10: TRoundRect;
    RoundRect11: TRoundRect;
    BtnCadUsuario: TSpeedButton;
    BtnCadProjeto: TSpeedButton;
    BtnCadAluno: TSpeedButton;
    BtnRelaAvaliacao: TSpeedButton;
    BtnRelaNota: TSpeedButton;
    BtnRelaProjeto: TSpeedButton;
    Image1: TImage;
    LayConsulta: TLayout;
    RouConsulta: TRoundRect;
    Label4: TLabel;
    RouConsUsuario: TRoundRect;
    BtnConsUsuario: TSpeedButton;
    Label5: TLabel;
    RouConsAluno: TRoundRect;
    BtnConsAlunos: TSpeedButton;
    RouConsProjeto: TRoundRect;
    BtnConsProjeto: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RoundRect5: TRoundRect;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BtnAtribuicao: TSpeedButton;
    procedure BtnCadUsuarioClick(Sender: TObject);
    procedure BtnCadEixoClick(Sender: TObject);
    procedure BtnCadAlunoClick(Sender: TObject);
    procedure BtnCadProjetoClick(Sender: TObject);
    procedure BtnConsUsuarioClick(Sender: TObject);
    procedure BtnConsAlunosClick(Sender: TObject);
    procedure BtnConsProjetoClick(Sender: TObject);
    procedure BtnAtribuicaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UCadUsuario, UCadAvaliadores, UCadEixo, UCadAluno, UCadProjeto,
  UAtribuicao, UConsUsuario, UConsAluno, UConsProjetos;

procedure TFrmMenu.BtnAtribuicaoClick(Sender: TObject);
begin
  FrmAtribuicao.op := 'i';
  FrmAtribuicao.cod := '0';
  FrmAtribuicao.Show;
end;

procedure TFrmMenu.BtnCadAlunoClick(Sender: TObject);
begin
  FrmCadAluno.Show;
end;

procedure TFrmMenu.BtnCadEixoClick(Sender: TObject);
begin
  FrmCadEixo.Show;
end;

procedure TFrmMenu.BtnCadProjetoClick(Sender: TObject);
begin
  FrmCadProjeto.op := 'i';
  FrmCadProjeto.cod := '0';
  FrmCadProjeto.Show;
end;

procedure TFrmMenu.BtnCadUsuarioClick(Sender: TObject);
begin
  FrmCadUsuario.op := 'i';
  FrmCadUsuario.cod := '0';
  FrmCadUsuario.Show;
end;

procedure TFrmMenu.BtnConsAlunosClick(Sender: TObject);
begin
  FrmConsAluno.Show;
end;

procedure TFrmMenu.BtnConsProjetoClick(Sender: TObject);
begin
  FrmConsProjeto.Show;
end;

procedure TFrmMenu.BtnConsUsuarioClick(Sender: TObject);
begin
  FrmConsUsuario.Show;
end;

end.
