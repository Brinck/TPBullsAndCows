program BulletsAndCows;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FGame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFGame, FGame);
  Application.Run;
end.
