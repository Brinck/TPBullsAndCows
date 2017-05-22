unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

const
  NBMOTS=10;

type
  TFGame = class(TForm)
    MListeMots: TMemo; //Memo contenant notre liste de mots
    LNbBonnePos: TLabel;
    SplitterTop1: TSplitter;
    PMotATrouver: TPanel;
    PNbBonnePos: TPanel;
    LMotATrouver: TLabel;
    EMotATrouver: TEdit;  //Edit contenant le mot � trouv� choisi al�atoirement dans le memo
    ENbBonnePos: TEdit; //Edit contenant le nombre de lettres � la bonne position
    PNbLettres: TPanel;
    SplitterTop2: TSplitter;
    LNbLettres: TLabel;
    ENbLettres: TEdit;  //Edit contenant le nombre de lettres du mot � trouver
    SplitterBottom1: TSplitter;
    PPrincipal: TPanel;
    LChoix: TLabel;
    EChoix: TEdit; //Edit contenant le choix du joueur
    SplitterBottom2: TSplitter;
    PBouton: TPanel;
    BValider: TButton;
    PNbBonneLettre: TPanel;
    SplitterTop3: TSplitter;
    LNbBonneLettre: TLabel;
    ENbBonneLettre: TEdit; //Edit contenant le nombre de bonnes lettres
    PNbVies: TPanel;
    SplitterTop4: TSplitter;
    LNbVies: TLabel;
    ENbVies: TEdit;
    function NombreVies:integer; //Calcul du nombre de vies
    procedure DebutJeu; //D�but du jeu
    procedure FormCreate(Sender: TObject);
    procedure BValiderClick(Sender: TObject);  //Lors de l'ouverture du programme d�bute le jeu
    procedure TourDeJeu; //Tour de jeu
    function TestMotTrouve:boolean; //Si le mot est trouv� ou non
    function Vivant:boolean; //Si l'utilisateur a toujours des vies ou non
    procedure MsgVictoire; //Message de victoire
    procedure MsgDefaite; //Message de d�faite
    procedure NombreLettreBonnePos;  //Affiche le nombre de lettres � la bonne position
    procedure NbLettresCorrectes;  //Affiche le nombre de lettres correctes
//    function Erreur:boolean; //S'il y a une erreur dans la saisie utilisateur ou non
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FGame: TFGame;

implementation

{$R *.dfm}

//BUT : D�finition du nombre de vies en fonction de la taille du mot � trouver
//ENTREE : Pas d'entr�e
{SORTIE :
- 3 lettres = 4 vies
- 4 lettres = 7 vies
- 5 lettres = 10 vies
- 6 lettres = 16 vies
- 7 lettres = 20 vies}
function TFGame.NombreVies:integer;
  var
    i:integer;

  begin
    i:=StrToInt(ENbLettres.Text);

     case i of
      3 : NombreVies:=4;
      4 : NombreVies:=7;
      5 : NombreVies:=10;
      6 : NombreVies:=16;
      7 : NombreVies:=20;
     end;
  end;

{BUT :   INITIALISATION DU DEBUT DU JEU
- Initialisation du choix du joueur par un vide
- Choix d'un mot � trouver al�atoire parmi la liste des mots et le stocke dans un edit
- Initialisation des edit du nombre de bonne lettres et de lettres � la bonne position
- Stockage de la longueur du mot dans un edit
- Initialisation du nombre de vies en fonction de la longueur du mot � trouver}
//ENTREE: Pas d'entr�e
{SORTIE :
- Nombre de lettres correctes et � la bonne position � 0
- Longueur du mot � trouver
- Le choix du joueur vide
- Nombre de vies
- Mot � trouver (pas visible par le joueur avant la fin du jeu)}
procedure TFGame.DebutJeu;
  var
    i:integer;
    LongMot:integer;//longueur du mot
    RandomMot:string; //Variable contenant le mot choisi al�atoirement

  begin
  //On cache le mot � trouver
  PMotATrouver.Enabled:=FALSE;

  //On prend un mot al�atoirement parmi la liste des mots
  Randomize;
  i:=random(NBMOTS); //Ligne du memo choisie al�atoirement
  RandomMot:=MListeMots.Lines[i]; //RandomMot prend un mot al�atoire sur une ligne choisie al�atoirement
  EMotATrouver.Text:=RandomMot;//Le mot � trouver est stock� dans l'edit

  //Initialisation de la variable de longueur du mot
  LongMot:=length(RandomMot);

  //Initialisation des edits
  ENbLettres.Text:=IntToStr(LongMot);    //Taille du mot � trouver
  ENbVies.Text:=IntToStr(NombreVies);   //Nombre de vies
  ENbBonnePos.Text:='0';
  ENbBonneLettre.Text:='0';
  EChoix.Text:=''; //On vide si jamais il reste un texte entr� par l'utilisateur

  end;



//BUT : Afficher TRUE ou FALSE suivant si l'utilisateur a trouv� le mot ou non
//ENTREE : Pas d'entr�e
//SORTIE : TRUE si le mot est trouv�, FALSE si le mot n'est pas trouv�
function TFGame.TestMotTrouve:boolean;
  begin
    if EChoix.Text=EMotATrouver.Text then //Si le choix et le mot � trouv� sont identiques
      begin
        TestMotTrouve:=TRUE; //Mot trouv�
      end
    ELSE
      begin
        TestMotTrouve:=FALSE;  //Mot pas trouv�
      end;
  end;

//BUT : Afficher TRUE ou FALSE suivant si l'utilisateur a toujours des vies ou non
//ENTREE : Pas d'entr�e
//SORTIE : TRUE si l'utilisateur a encore des vie, False si l'utilisateur n'a plus de vies
function TFGame.Vivant:boolean;
  var
    vies:integer;
  begin
    //Initialisation de la variable de vies
    vies:=StrToInt(ENbVies.Text);

    //Si le joueur n'a plus de vies
    if vies>0 then
      begin
      Vivant:=TRUE;  //Si le joueur est vivant
      end
    ELSE
      begin
      Vivant:=FALSE; //Si le joueur est mort
      end;

  end;


//BUT : Afficher un message de victoire et demander si l'utilisateur veut recommencer le jeu ou non
//ENTREE : Oui ou non
//SORTIE : Quitte le jeu ou recommence une partie
procedure TFGame.MsgVictoire;
  begin
      //Demande si le joueur veut recommencer le jeu, sinon demande confirmation de quitter
      if MessageDlg('Vous avez gagn� ! Voulez-vous recommencer ?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          DebutJeu;
        end
      ELSE
        begin
          //Demande si le joueur veut quitter le jeu, sinon recommence le jeu
          if MessageDlg('Voulez-vous vraiment quitter le jeu ?',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
            begin
              Close;
            end
          ELSE
            begin
              DebutJeu;
            end;
        end;
  end;

//BUT : Afficher un message de d�faite et demander si l'utilisateur veut recommencer le jeu ou non
//ENTREE : Oui ou non
//SORTIE : Quitte le jeu ou recommence une partie
procedure TFGame.MsgDefaite;
  begin
      //Demande si le joueur veut recommencer le jeu, sinon demande confirmation de quitter
      if MessageDlg('Vous avez perdu ! Voulez-vous recommencer ?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          DebutJeu;
        end
      ELSE
        begin
          //Demande si le joueur veut quitter le jeu, sinon recommence le jeu
          if MessageDlg('Voulez-vous vraiment quitter le jeu ?',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
            begin
              Close;
            end
          ELSE
            begin
              DebutJeu;
            end;
        end;
  end;


//BUT : V�rifie caract�re par caract�re si le joueur a les lettres � la bonne position
//ENTREE : Pas d'entr�e
//SORTIE : Nombre de lettres � la bonne place
procedure TFGame.NombreLettreBonnePos;
  var
    i:integer;
    TailleMot:integer; //Taille du mot
    NbBonnePosition:integer; //Nombre de lettres � la bonne position

  begin
    //Initialisation de la variable contenant la taille du mot
    TailleMot:=StrToInt(ENbLettres.Text);

    //Initialisation du nombre de lettres � la bonne position � 0 et de la variable contenant le nombre de lettres � la bonne position
    ENbBonnePos.Text:='0';
    NbBonnePosition:=StrToInt(ENbBonnePos.Text);

    //Regarde caract�re par caract�re
    for i := 1 to TailleMot do
      begin
        //Si la lettre est � la bonne position
        if EChoix.Text[i]=EMotATrouver.Text[i] then
          begin
            NbBonnePosition:=NbBonnePosition+1;
          end;

      end;

    //On affiche le nombre de lettres � la bonne position
    ENbBonnePos.Text:=IntToStr(NbBonnePosition);
  end;


//BUT : V�rifie caract�re par caract�re le nombre de lettres correctes
//ENTREE : Pas d'entr�e
//SORTIE : Nombre de lettres correctes
procedure TFGame.NbLettresCorrectes;
  var
    i, j:integer;
    NbCorrectes:integer; //Nombre de lettres correctes
    TailleMot:integer; //Taille du mot

  begin
    //Initialisation de la variable contenant la taille du mot
    TailleMot:=StrToInt(ENbLettres.Text);

    //Initialisation du nombre de lettres correctes � 0 et de la variable contenant le nombre de lettres correctes
    ENbBonneLettre.Text:='0';
    NbCorrectes:=StrToInt(ENbBonneLettre.Text);

    //Regarde caract�re par caract�re
    for i := 1 to TailleMot do
      begin
        for j := 1 to TailleMot do
          begin
            //Si la lettre est correcte
            if EChoix.Text[i]=EMotATrouver.Text[j] then
              begin
                NbCorrectes:=NbCorrectes+1;
              end;
          end;
      end;

    //On affiche le nombre de lettres correctes
    ENbBonneLettre.Text:=IntToStr(NbCorrectes);
  end;

{
//BUT : V�rifie caract�re par caract�re si le joueur a fait une erreur de saisie
//ENTREE : Pas d'entr�e
//SORTIE : TRUE s'il y a une erreur, sinon FALSE
function TFGame.Erreur:boolean;
  var
    i:integer;
    TailleMot:integer; //Taille du mot
    charmin,charmax:integer; //A et Z en majuscule

  begin
    //Initialisation de la variable contenant la taille du mot
    TailleMot:=StrToInt(ENbLettres.Text);

    //Initialisation de la variable contenant A et Z majuscule
    charmin:=

    //Regarde caract�re par caract�re
    for i := 1 to TailleMot do
      begin
        //S'il y a une majuscule
        if ord(EChoix.Text[i])>=65 AND ord(EChoix.Text[i])<=90 then
          begin
            Erreur:=TRUE;
          end
        ELSE
          begin
            Erreur:=FALSE;
          end;
      end;

    //Si le mot choisi est plus long ou plus court que le mot � trouver
    if (length(EChoix.Text)<>TailleMot)) then
      begin
        Erreur:=TRUE;
      end
    ELSE
      begin
        Erreur:=FALSE;
      end;
  end;}

procedure  TFGame.TourDeJeu;
  var
    vies:integer;

  begin
  //Initialisation de la variable de vies
  vies:=StrToInt(ENbVies.Text);

  //Affichage du nombre de lettres � la bonne position
  NombreLettreBonnePos;

  //Affiche le nombre de lettres correctes
  NbLettresCorrectes;

  //Si le joueur trouve le mot
  if TestMotTrouve=TRUE then
    begin
      MsgVictoire;   //Message de victoire
      PMotATrouver.Enabled:=TRUE;  //On affiche le mot � trouver
    end
  ELSE
    begin
      //Si le joueur a faux, lui enl�ve une vie
      ENbVies.Text:=IntToStr(vies-1);

      //Si le joueur n'a plus de vies
      if Vivant=FALSE then
        begin
          MsgDefaite;   //Message de d�faite
          PMotATrouver.Enabled:=TRUE;  //On affiche le mot � trouver
        end;

    end;

  end;

procedure TFGame.FormCreate(Sender: TObject);
begin
  //Debut du jeu
  DebutJeu;
end;

procedure TFGame.BValiderClick(Sender: TObject);
begin
  //Tour de jeu
  TourDeJeu;
end;


end.
