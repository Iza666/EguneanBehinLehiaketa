PImage img; //Atzealdeko irudia
int count;
int irudiaCount = 1;  //Zenbat irudi sortu nahi ditugun
int x;
int y;
int azkenX;  //Azkenengo ezarri den puntuaren X ardatzaren balioa
int azkenY;  //Azkenengo ezarri den puntuaren Y ardatzaren balioa
boolean X_ondo;
boolean Y_ondo;
int[][] puntuak1;  //Bideko puntuentzako array bidimentsionalak
int[][] puntuak2;
int[][] puntuak3;
int puntua1_X = 122;  //Irudian, ixa edo Tick-aren gainean dauden puntuen koordenatuak / bideen bukaerako puntuak
int puntua1_Y = 320;
int puntua2_X = 296;
int puntua2_Y = 320; 
int puntua3_X = 471;
int puntua3_Y = 320;
int erantzuna;  //Erantzuna zuzena eta okerrak gordetzeko
int okerra1;
int okerra2;
String pngPath = "irudiak/";  //irudiak gordeko diren helbidea
String csvPath = "Bideak.csv";  //Sortuko den csv artxiboaren izena
Table csvTaula;  //Csv fitxategia sortzeko erabilitako taula

void setup() {  //Setup funtzioa lehenengo eta behin soilik exekutatzen da 
  size(600, 400);  //Canvas-aren tamainua
  img = loadImage("EguneanBehin.png");  //Irudia kargatzen du 'data' karpetatik 
  
  csvTaula = new Table();  //Csv-a sortzeko taularen goiburuak ezartzeko 
  csvTaula.addColumn("Mota");
  csvTaula.addColumn("Galdera");
  csvTaula.addColumn("Erantzun zuzena");
  csvTaula.addColumn("Erantzun okerra 1");
  csvTaula.addColumn("Erantzun okerra 2");
  csvTaula.addColumn("Fitxategia"); 
}
void draw(){  //Draw funtzioa etengabean exekutatzen da Processing-en
  while(irudiaCount > 0){  //Nahi ditugun irudien arabera loop-eatuko du
    background(255);  //Loop bat amaitzean atzealdea ezabatuko du 
    image(img, 0, 0);  //Berriro 'data' karpetan dagoen artxiboa ezarriko du atzealdean
    puntuak1 = new int[5][2];  //Array-ak berriro hasieratzen ditu //<>//
    puntuak2 = new int[5][2];
    puntuak3 = new int[5][2];
    count = 0;  
    
    puntuak1[0][0] = 122;  //Array bakoitzaren lehen posizioan, irudiako zenbakien azpian dauden puntuen posizioa sartzen da
    puntuak1[0][1] = 79;
    puntuak2[0][0] = 296;
    puntuak2[0][1] = 79;
    puntuak3[0][0] = 471;
    puntuak3[0][1] = 79;
    
    azkenX = 122;  //Hurrengo puntua 
    azkenY = 79;
    while(count < 9){  //While honetan bideek edukiko dituzten ausazko puntuak erabakiko dira
      if(count < 3){  //Lehen array-a betetzeko
        XY_ezarri();  //Puntu berriaren X eta Y lortu
        count++;
        puntuak1[count][0] = x;  //Puntua array-ra gehitu
        puntuak1[count][1] = y;
      }
      else if(count >= 3 && count < 6){  //Bigarren array-a betetzeko
        if(count == 3){  //Bide ezberdinarekin hasi garenez bide honetako lehenengo puntua jarriko dugu azkenX eta azkenY-n
          azkenX = 296;
          azkenY = 79;
        }
        XY_ezarri();  //Puntu berriaren X eta Y lortu
        count++;
        puntuak2[count-3][0] = x;  //Puntua array-ra gehitu
        puntuak2[count-3][1] = y;
      }
      else if(count >= 6 && count < 9){  //Hirugarren array-a betetzeko
        if(count == 6){  //Bide ezberdinarekin hasi garenez bide honetako lehenengo puntua jarriko dugu azkenX eta azkenY-n
           azkenX = 471;
           azkenY = 79;
        }
        XY_ezarri();  //Puntu berriaren X eta Y lortu
        count++;
        puntuak3[count-6][0] = x;  //Puntua array-ra gehitu
        puntuak3[count-6][1] = y;
      }
    }
    
    azkenPuntuak_Erantzuna();  //Azken puntuak gehitu Array-etara
    
    marraztuMarrak(puntuak1);  //Azkenik, marrak marrazten dira irudia gordetzeko
    marraztuMarrak(puntuak2);
    marraztuMarrak(puntuak3);
    gordeIrudiakCsv();  //Irudia .png luzapenarekin gordetzen da eta haren informazioa csv artxiboan gordetzen da
    --irudiaCount;
  }
}

void XY_ezarri(){  //Puntu bat bere aurreko puntutik distantzia zehatz batera agertzeko, marrazkiak ulergarriagoak izan daitezen 
  X_ondo = false;
  Y_ondo = false;
  x = int(random(75, 550));
  y = int(random(100, 290)); //<>//
  while(!X_ondo){ //<>//
    if(x == azkenX){ //<>//
      x = int(random(75, 550));
    }
    else if(x < azkenX){ //<>//
      if(x < azkenX-200){
        azkenX = x; //<>//
        X_ondo = true;
      }
      else{
        x = int(random(75, 550)); //<>//
      } //<>//
    } //<>//
    else{
      if(x > azkenX+200) {
        azkenX = x; //<>//
        X_ondo = true;
      }
      else{
        x = int(random(75, 550));
      }
    }
  }
  while(!Y_ondo){
    if(y == azkenY){
      y = int(random(100, 290));
    }
    else if(y < azkenY){
      if(y < azkenY-75){
        azkenY = y;
        Y_ondo = true;
      }
      else{
        y = int(random(100, 290));
      }
    }
    else{
      if(y > azkenY+75){
        azkenY = y;
        Y_ondo = true;
      }
      else{
        y = int(random(100, 290));
      }
    }
  }
}
void azkenPuntuak_Erantzuna(){  //Bide bakoitzaren bukaera eta ondorioz, erantzun zuzena zein izango den erabakitzen da hemen
  int num1 = int(random(1, 4));
  int num2 = int(random(1, 4));
  while(num1 != num2){
    num2 = int(random(1, 4));
  }
  if(num1 == 1){
    puntuak1[4][0] = puntua1_X;
    puntuak1[4][1] = puntua1_Y;
    if(num2 == 2){
      puntuak2[4][0] = puntua2_X;
      puntuak2[4][1] = puntua2_Y;
      puntuak3[4][0] = puntua3_X;
      puntuak3[4][1] = puntua3_Y;
      erantzuna = 2;
      okerra1 = 1;
      okerra2 = 3;
    }
    else{
      puntuak2[4][0] = puntua3_X;
      puntuak2[4][1] = puntua3_Y;
      puntuak3[4][0] = puntua2_X;
      puntuak3[4][1] = puntua2_Y;
      erantzuna = 3;
      okerra1 = 2;
      okerra2 = 1;
    }
  }
  else if(num1 == 2){
    puntuak1[4][0] = puntua2_X;
    puntuak1[4][1] = puntua2_Y;
    erantzuna = 1;
    okerra1 = 2;
    okerra2 = 3;
    if(num2 == 1){
      puntuak2[4][0] = puntua1_X;
      puntuak2[4][1] = puntua1_Y;
      puntuak3[4][0] = puntua3_X;
      puntuak3[4][1] = puntua3_Y;
    }
    else{
      puntuak2[4][0] = puntua3_X;
      puntuak2[4][1] = puntua3_Y;
      puntuak3[4][0] = puntua1_X;
      puntuak3[4][1] = puntua1_Y;
    }
  }
  else if(num1 == 3){
    puntuak1[4][0] = puntua3_X;
    puntuak1[4][1] = puntua3_Y;
    if(num2 == 2){
      puntuak2[4][0] = puntua1_X;
      puntuak2[4][1] = puntua1_Y;
      puntuak3[4][0] = puntua2_X;
      puntuak3[4][1] = puntua2_Y;
      erantzuna = 3;
      okerra1 = 1;
      okerra2 = 2;
    }
    else{
      puntuak2[4][0] = puntua2_X;
      puntuak2[4][1] = puntua2_Y;
      puntuak3[4][0] = puntua1_X;
      puntuak3[4][1] = puntua1_Y;
      erantzuna = 2;
      okerra1 = 3;
      okerra2 = 1;
    }
  }
}
int delta = 150;  //Kurba bakoitzak izango duen forma, bariable honen balioa 0 izan ezkero marrak zuzenak izango lirateke
void marraztuMarrak(int[][] puntuak){
  for(int i = 0; i < puntuak.length-1; i++){
    strokeWeight(1);  //Marren zabalera
    stroke(50, 50, 50);  //Marren kolorea
    noFill();
    bezier(  //Bezier funtzioak kurba horiek marrazteko aukera ematen digu
      puntuak[i][0], puntuak[i][1],
      puntuak[i][0] + delta, puntuak[i][1],
      puntuak[i+1][0] - delta, puntuak[i+1][1], 
      puntuak[i+1][0], puntuak[i+1][1]
    );
  }
}
void gordeIrudiakCsv(){  //Irudiak eta csv fitxategia gordetzeko balio digu
  String fitxategia = "";  //Fitxategiaren izena ausazko 9 zenbakik osatzen du 
  for(int kontua = 0; kontua < 9; kontua++){
    int zenb = int(random(0, 10));
    fitxategia += "_"+zenb;
  }
  saveFrame(pngPath+"bidea"+fitxategia+".png");  //saveFrame funtzioak irudia gordeko digu
  
  
  
  TableRow galderaBerria = csvTaula.addRow();  //Irudi bakoitzeko, csv-ra beharrezko informazioa gehituko zaio
  galderaBerria.setString("Mota", "Bideak");
  galderaBerria.setString("Galdera", "Zein da bide egokia?");
  galderaBerria.setInt("Erantzun zuzena", erantzuna);
  galderaBerria.setInt("Erantzun okerra 1", okerra1);
  galderaBerria.setInt("Erantzun okerra 2", okerra2);
  galderaBerria.setString("Fitxategia", "irudiak/bidea"+fitxategia);
  
  saveTable(csvTaula, csvPath);  //Csv-ko aldaketak gorde
}
