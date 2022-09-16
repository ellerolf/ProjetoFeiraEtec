program PFeira;

uses
  System.StartUpCopy,
  FMX.Forms,
  UAcesso in 'UAcesso.pas' {FrmAcesso},
  UMenu in 'UMenu.pas' {FrmMenu},
  UCadUsuario in 'UCadUsuario.pas' {FrmCadUsuario},
  UCadAvaliadores in 'UCadAvaliadores.pas' {FrmCadAvaliadores},
  UCadEixo in 'UCadEixo.pas' {FrmCadEixo},
  UCadAluno in 'UCadAluno.pas' {FrmCadAluno},
  UCadProjeto in 'UCadProjeto.pas' {FrmCadProjeto},
  UAtribuicao in 'UAtribuicao.pas' {FrmAtribuicao},
  UConsUsuario in 'UConsUsuario.pas' {FrmConsUsuario},
  UConsAluno in 'UConsAluno.pas' {FrmConsAluno},
  UConsProjetos in 'UConsProjetos.pas' {FrmConsProjeto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmAcesso, FrmAcesso);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmCadUsuario, FrmCadUsuario);
  Application.CreateForm(TFrmCadAvaliadores, FrmCadAvaliadores);
  Application.CreateForm(TFrmCadEixo, FrmCadEixo);
  Application.CreateForm(TFrmCadAluno, FrmCadAluno);
  Application.CreateForm(TFrmCadProjeto, FrmCadProjeto);
  Application.CreateForm(TFrmAtribuicao, FrmAtribuicao);
  Application.CreateForm(TFrmConsUsuario, FrmConsUsuario);
  Application.CreateForm(TFrmConsAluno, FrmConsAluno);
  Application.CreateForm(TFrmConsProjeto, FrmConsProjeto);
  Application.Run;
end.
