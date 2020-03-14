PImage img;
int count = 0;
int irudiaCount = 100;
int x;
int y;
int azkenX;
int azkenY;
boolean X_ondo;
boolean Y_ondo;
int[][] puntuak1 = new int[5][2];
int[][] puntuak2 = new int[5][2];
int[][] puntuak3 = new int[5][2];
int puntua1_X = 122;
int puntua1_Y = 320;
int puntua2_X = 296;
int puntua2_Y = 320;
int puntua3_X = 471;
int puntua3_Y = 320;
int erantzuna;
int okerra1;
int okerra2;
String pngPath = "irudiak/";
String csvPath = "Bideak.csv";
Table csvTaula;

void setup() {
  size(600, 400);
  img = loadImage("EguneanBehin.png");
  
  csvTaula = new Table();
  csvTaula.addColumn("Mota");
  csvTaula.addColumn("Galdera");
  csvTaula.addColumn("Erantzun zuzena");
  csvTaula.addColumn("Erantzun okerra 1");
  csvTaula.addColumn("Erantzun okerra 2");
  csvTaula.addColumn("Fitxategia");
}
void draw(){
  while(irudiaCount > 0){
    background(255);
    image(img, 0, 0);
    puntuak1 = new int[5][2]; //<>//
    puntuak2 = new int[5][2];
    puntuak3 = new int[5][2];
    count = 0;
    
    puntuak1[0][0] = 122;
    puntuak1[0][1] = 79;
    puntuak2[0][0] = 296;
    puntuak2[0][1] = 79;
    puntuak3[0][0] = 471;
    puntuak3[0][1] = 79;
    
    azkenX = 122;
    azkenY = 79;
    while(count < 9){
      if(count < 3){
        XY_ezarri();
        count++;
        puntuak1[count][0] = x;
        puntuak1[count][1] = y;
      }
      else if(count >= 3 && count < 6){
        if(count == 3){
          azkenX = 296;
          azkenY = 79;
        }
        XY_ezarri();
        count++;
        puntuak2[count-3][0] = x;
        puntuak2[count-3][1] = y;
      }
      else if(count >= 6 && count < 9){
        if(count == 6){
           azkenX = 471;
           azkenY = 79;
        }
        XY_ezarri();
        count++;
        puntuak3[count-6][0] = x;
        puntuak3[count-6][1] = y;
      }
    }
    
    azkenPuntuak_Erantzuna();
    
    marraztuMarrak(puntuak1);
    marraztuMarrak(puntuak2);
    marraztuMarrak(puntuak3);
    gordeIrudiakCsv();
    --irudiaCount;
  }
}

void XY_ezarri(){
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
void azkenPuntuak_Erantzuna(){
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
int delta = 150;
void marraztuMarrak(int[][] puntuak){
  for(int i = 0; i < puntuak.length-1; i++){
    strokeWeight(1);
    stroke(50, 50, 50);
    noFill();
    bezier(
      puntuak[i][0], puntuak[i][1],
      puntuak[i][0] + delta, puntuak[i][1],
      puntuak[i+1][0] - delta, puntuak[i+1][1], 
      puntuak[i+1][0], puntuak[i+1][1]
    );
  }
}
void gordeIrudiakCsv(){
  String fitxategia = "";
  for(int kontua = 0; kontua < 9; kontua++){
    int zenb = int(random(0, 10));
    fitxategia += "_"+zenb;
  }
  saveFrame(pngPath+"bidea"+fitxategia+".png");
  
  
  
  TableRow galderaBerria = csvTaula.addRow();
  galderaBerria.setString("Mota", "Bideak");
  galderaBerria.setString("Galdera", "Zein da bide egokia?");
  galderaBerria.setInt("Erantzun zuzena", erantzuna);
  galderaBerria.setInt("Erantzun okerra 1", okerra1);
  galderaBerria.setInt("Erantzun okerra 2", okerra2);
  galderaBerria.setString("Fitxategia", "irudiak/bidea"+fitxategia);
  
  saveTable(csvTaula, csvPath);
}
