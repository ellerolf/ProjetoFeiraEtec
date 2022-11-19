program PFeira;

uses
  System.StartUpCopy,
  FMX.Forms,
  UAcesso in 'UAcesso.pas' {FrmAcesso},
  UMenu in 'UMenu.pas' {FrmMenu},
  UCadUsuario in 'UCadUsuario.pas' {FrmCadUsuario},
  UCadAluno in 'UCadAluno.pas' {FrmCadAluno},
  UCadProjeto in 'UCadProjeto.pas' {FrmCadProjeto},
  UAlteraAtribuicao in 'UAlteraAtribuicao.pas' {FrmAlteraAtribuicao},
  UConsUsuario in 'UConsUsuario.pas' {FrmConsUsuario},
  UConsAluno in 'UConsAluno.pas' {FrmConsAluno},
  UConsProjetos in 'UConsProjetos.pas' {FrmConsProjeto},
  UModulo in 'UModulo.pas' {DM: TDataModule},
  UAtribuicao in 'UAtribuicao.pas' {FrmAtribuicao},
  URelProjetos in 'URelProjetos.pas' {frmrelprojetos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmCadUsuario, FrmCadUsuario);
  Application.CreateForm(TFrmCadAluno, FrmCadAluno);
  Application.CreateForm(TFrmCadProjeto, FrmCadProjeto);
  Application.CreateForm(TFrmAlteraAtribuicao, FrmAlteraAtribuicao);
  Application.CreateForm(TFrmConsUsuario, FrmConsUsuario);
  Application.CreateForm(TFrmConsAluno, FrmConsAluno);
  Application.CreateForm(TFrmConsProjeto, FrmConsProjeto);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmAcesso, FrmAcesso);
  Application.CreateForm(TFrmAtribuicao, FrmAtribuicao);
  Application.CreateForm(Tfrmrelprojetos, frmrelprojetos);
  Application.Run;
end.
