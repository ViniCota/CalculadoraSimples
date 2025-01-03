unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Btn7: TButton;
    BtnMultiplicacao: TButton;
    BtnSubtracao: TButton;
    BtnAdicao: TButton;
    Btn4: TButton;
    BtnIgual: TButton;
    BtnVirgula: TButton;
    Btn8: TButton;
    Btn0: TButton;
    Btn5: TButton;
    Btn1: TButton;
    Btn9: TButton;
    Btn6: TButton;
    Btn2: TButton;
    Btn3: TButton;
    BtnDivisao: TButton;
    BtnLimpar: TButton;
    Visor: TEdit;
    memHistorico: TMemo;
    procedure Btn0Click(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure Btn3Click(Sender: TObject);
    procedure Btn4Click(Sender: TObject);
    procedure Btn5Click(Sender: TObject);
    procedure Btn6Click(Sender: TObject);
    procedure Btn7Click(Sender: TObject);
    procedure Btn8Click(Sender: TObject);
    procedure Btn9Click(Sender: TObject);
    procedure BtnVirgulaClick(Sender: TObject);
    procedure BtnAdicaoClick(Sender: TObject);
    procedure BtnSubtracaoClick(Sender: TObject);
    procedure BtnMultiplicacaoClick(Sender: TObject);
    procedure BtnDivisaoClick(Sender: TObject);
    procedure BtnIgualClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    ValorAtual: double;
    operacao: integer;
    limpar: boolean;
    procedure Historico(const operacao: string;
      valor1, valor2, resultado: double);
    function Simbolo(operacao: integer): String;
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
{ Eventos Click }

procedure TForm2.Historico(const operacao: string;
  valor1, valor2, resultado: double);
begin
  memHistorico.Lines.Add(Format('%f %s %f = %f', [valor1, operacao, valor2,
    resultado]));
end;

function TForm2.Simbolo(operacao: integer): String;
begin
  case operacao of
    1:
      result := '+';
    2:
      result := '-';
    3:
      result := 'x';
    4:
      result := '/';
  end;
end;

procedure TForm2.Btn0Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '0';
end;

procedure TForm2.Btn1Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '1';
end;

procedure TForm2.Btn2Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '2';
end;

procedure TForm2.Btn3Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '3';
end;

procedure TForm2.Btn4Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '4';
end;

procedure TForm2.Btn5Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '5';
end;

procedure TForm2.Btn6Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '6';
end;

procedure TForm2.Btn7Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '7';
end;

procedure TForm2.Btn8Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '8';
end;

procedure TForm2.Btn9Click(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + '9';
end;

procedure TForm2.BtnVirgulaClick(Sender: TObject);
begin
  if limpar then
  begin

    Visor.Text := '';
    limpar := false;
  end;
  Visor.Text := Visor.Text + ',';
end;

{ Click operacao }
procedure TForm2.BtnAdicaoClick(Sender: TObject);
begin
  operacao := 1;
  limpar := true;
  ValorAtual := StrToFloat(Visor.Text);
end;

procedure TForm2.BtnSubtracaoClick(Sender: TObject);
begin
  operacao := 2;
  limpar := true;
  ValorAtual := StrToFloat(Visor.Text);
end;

procedure TForm2.BtnMultiplicacaoClick(Sender: TObject);
begin
  operacao := 3;
  limpar := true;
  ValorAtual := StrToFloat(Visor.Text);
end;

procedure TForm2.BtnDivisaoClick(Sender: TObject);
begin
  operacao := 4;
  limpar := true;
  ValorAtual := StrToFloat(Visor.Text);
end;

procedure TForm2.BtnIgualClick(Sender: TObject);
var
  valor2, resultado: double;
begin
  valor2 := StrToFloat(Visor.Text);
  case operacao of
    1:
      resultado := ValorAtual + valor2;
    2:
      resultado := ValorAtual - valor2;
    3:
      resultado := ValorAtual * valor2;
    4:
      resultado := ValorAtual / valor2;
  end;

 Historico(Simbolo(operacao),valoratual, valor2, resultado);

  limpar := true;
  Visor.Text := FloatToStr(resultado);
  ValorAtual := resultado;
end;
procedure TForm2.BtnLimparClick(Sender: TObject);
begin
  ValorAtual := 0;
  Visor.Text := '0';
  operacao := 0;
  limpar := true;
  memHistorico.Clear;
end;

end.
