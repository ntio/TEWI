unit utewi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  PrintersDlgs, JDBLabeledFloatEdit, JLabeledFloatEdit,usplash;

type

  { TForm1 }

  TForm1 = class(TForm)
    btcalcularButton1: TButton;
    cbgwp: TComboBox;
    cbL: TComboBox;
    cbn: TComboBox;
    cbB: TComboBox;
    cbReciclaje: TComboBox;
    edgwp: TEdit;
    edB: TEdit;
    edfugas: TEdit;
    eddesguace: TEdit;
    edenergia: TEdit;
    edtewiesp: TEdit;
    edsseer: TEdit;
    edtoneladas: TEdit;
    edReciclaje: TEdit;
    edn: TEdit;
    edL: TEdit;
    edm: TJLabeledFloatEdit;
    edEanual: TJLabeledFloatEdit;
    edEreciclar: TJLabeledFloatEdit;
    edRefigeracion: TJLabeledFloatEdit;
    edcalorifica: TJLabeledFloatEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    procedure btcalcularButton1Click(Sender: TObject);
    procedure cbBChange(Sender: TObject);
    procedure cbgwpChange(Sender: TObject);
    procedure cbLChange(Sender: TObject);
    procedure cbnChange(Sender: TObject);
    procedure cbReciclajeChange(Sender: TObject);
    procedure edcalorificaChange(Sender: TObject);
    procedure edEanualChange(Sender: TObject);
    procedure edEreciclarChange(Sender: TObject);
    procedure edmChange(Sender: TObject);
    procedure edRefigeracionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  GWP : Real;
  L   : Real;
  n   : Real;
  m   : Real;
  B   : Real;
  Ereciclaje: Real;
  Erefrigeracion: Real;
  Ecalorifica: Real;
  Ereciclar : Real;
  factorsuma: Real;
  energy: Real;
  sseerr: Real;
  tewiesp : Real;
  resultado: Real;
  fugas :Real;
  desguace : Real;
  desguace2: Real;
  Eanual : Real;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.cbgwpChange(Sender: TObject);
var
  valor :integer;
begin
  valor:= cbgwp.ItemIndex;
    case valor of
     0: GWP:=675;
     1: GWP:=1430;
     2: GWP:=1774;
     3: GWP:=2088;
     4: GWP:=2346;
     5: GWP:=3922;
     6: GWP:=3985;
     7: GWP:=3;
     8: GWP:=1;
     9: GWP:=0;
    end;
    edgwp.Text:=FloatToStr(GWP);
end;

procedure TForm1.cbBChange(Sender: TObject);
begin
  case cbB.ItemIndex of
   0: B:= 0.120;
   1: B:= 0.005;
   2: B:= 0.280;
  end;
  edB.Text:=FloatToStr(B);
end;

procedure TForm1.btcalcularButton1Click(Sender: TObject);
begin
  factorsuma:=(GWP * L * m * n) + (GWP * m * (1 - Ereciclaje)) + (Eanual * n * B);
  //ShowMessage(FloatToStr(factorsuma));
  desguace:= (Ereciclar + Erefrigeracion + Ecalorifica);
  edtoneladas.Text:=FloatToStr(factorsuma/1000);
  fugas:=(100*(GWP*L*m*n)/factorsuma);
  edfugas.Text:=FloatToStr(fugas);
  desguace2:=(100*(GWP*m*(1-Ereciclaje))/factorsuma);
  eddesguace.Text:=FloatToStr(desguace2);
  energy:=(100*(Eanual*n*B)/factorsuma);
  edenergia.Text:=FloatToStr(energy);
  tewiesp:=(factorsuma/desguace);
  edtewiesp.Text:=FloatToStr(tewiesp);
  sseerr:=(desguace/Eanual);
  edsseer.Text:=FloatToStr(sseerr);
end;

procedure TForm1.cbLChange(Sender: TObject);
begin
  case cbL.ItemIndex of
   0: L:=0.5;
   1: L:=2.5;
   2: L:=1.0;
   3: L:=3.5;
   4: L:=2.0;
   5: L:=7.0;
   6: L:=5.0;
   7: L:=10.0;
   8: L:=5.0;
   9: L:=10.0;
   10: L:=10.0;
   11: L:=15.0;
  end;
  L:=L/100;
  edL.Text:=FloatToStr(L);
end;

procedure TForm1.cbnChange(Sender: TObject);
begin
 case cbn.ItemIndex of
  0: n:=10;
  1: n:=15;
 end;
 edn.Text:=FloatToStr(n);
end;

procedure TForm1.cbReciclajeChange(Sender: TObject);
begin
  case cbReciclaje.ItemIndex of
   0: Ereciclaje:=0.90;
   1: Ereciclaje:=0.95;
   2: Ereciclaje:=0;
  end;
  edReciclaje.Text:=FloatToStr(Ereciclaje);
end;

procedure TForm1.edcalorificaChange(Sender: TObject);
begin
  Ecalorifica:=edcalorifica.Value;
end;

procedure TForm1.edEanualChange(Sender: TObject);
begin
  Eanual:=edEanual.Value;
end;

procedure TForm1.edEreciclarChange(Sender: TObject);
begin
  Ereciclar:=edEreciclar.Value;
end;

procedure TForm1.edmChange(Sender: TObject);
begin
  m:=edm.Value;
end;

procedure TForm1.edRefigeracionChange(Sender: TObject);
begin
  Erefrigeracion:=edRefigeracion.Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  cbL.Text:=cbL.Items[0];
  cbLChange(Sender);
  cbn.Text:=cbn.Items[0];
  cbnChange(Sender);
  cbgwp.Text:=cbgwp.Items[0];
  cbgwpChange(Sender);
  cbReciclaje.Text:=cbReciclaje.Items[0];
  cbReciclajeChange(Sender);
  cbB.Text:=cbB.Items[0];
  cbBChange(Sender);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
     Form2.Show;
end;

procedure TForm1.Label30Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
   Form2.Show;
    Form2.Update;
end;

end.

