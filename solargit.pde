import javax.swing.*;//libreria de cuadros de dialogo
PImage redsolar,bueno,malo,red,info,volver;    //declaro imagenes
PFont titulo,normal;    //declaro fuentes de letra

int paso=0,boton=0,ok=0,c=0,c1=0,c2=0,c3=0,c4=0,c5=0,c6=0,c7=0,c8=0;

//variables de sistema fotovoltaico
float voca=0,isca=0,ppa=0,Ba=0;

//variables de inversor
float ipa=0,ivmaxa=0,ivmina=0,iimaxa=0,ipmin=0,ipmax=0,iiaca=0; 

//variables de diseno
float tmina=0;    
int nsa=0,npa=0,nsmax=0,nsmin=0,npmax=0; 

//resultados
float ppp=0,voctmax=0,voctmin=0,vocdmax=0,idmax=0;   

//resultados normativas
int npaneles=0;
float vocmax=0,iscstring=0,iscmax=0,ifdc=0,t=0,is=0,iis=0;    

//variables de conductores
float [] idc={14,18,25,30,40,55,75,95,110,130,150};
int [] awgdc={18,16,14,12,10,8,6,4,3,2,1};
float awg1;
float [] cgnd={14,12,10,10,10,8,6,4,3,2,1};
float [] ignd={15,20,30,40,60,100,200,300,400,500,600};

void setup(){

  background(224,224,224);
  size(1050,650);    //tamaño de ventana 
  
  redsolar=loadImage("redsolar.jpg");    //descarga imagen 
    redsolar.resize(850,300);    //tamaño de imagen
  bueno=loadImage("bueno.jpg");    //descarga imagen 
    bueno.resize(100,100);    //tamaño de imagen
  malo=loadImage("malo.jpg");    //descarga imagen 
    malo.resize(100,100);    //tamaño de imagen
  red=loadImage("red.jpg");    //descarga imagen 
    red.resize(850,200);    //tamano de imagen
  info=loadImage("info.jpg");    //descarga imagen 
    info.resize(25,25);    //tamano de imagen
  volver=loadImage("volver.jpg");    //descarga imagen 
    volver.resize(300,50);    //tamano de imagen
      
  titulo=loadFont("titulo.vlw");
  normal=loadFont("normal.vlw");
   
  fill(126,190,190);    //cuadro de titulo
    rect(100,20,850,70,10);
  fill(0);
  textFont(titulo,17);
    text("SOFTWARE PARA LA APLICACION DE LAS NORMATIVAS (NEC2014-NTC2050-RETIE)\n     EN UN SISTEMA DE ENERGIA SOLAR FOTOVOLTAICA DE CONEXION A LA RED",125,50);
}

void draw(){  
      
  JTextField pp = new JTextField();    //panel
  JTextField voc = new JTextField();
  JTextField isc = new JTextField();
  JTextField B = new JTextField();
     
  JTextField ip = new JTextField();   //inversor
  JTextField ivmax = new JTextField();
  JTextField ivmin = new JTextField();
  JTextField iimax = new JTextField();
  JTextField iiac = new JTextField();
        
  JTextField tmin = new JTextField();  //diseno
  JTextField ns = new JTextField();    
  JTextField np = new JTextField();

  Object[] panel = {
    "Ingrese P(W):",pp,
    "Ingrese Voc(V):",voc,
    "Ingrese Isc(A):",isc,
    "Ingrese coeficiente de temperatura Voc(%):",B,};
  Object[] inversor = {
    "Ingrese P(kW):",ip,
    "Ingrese Vmax(V):",ivmax,
    "Ingrese Vmin(V):",ivmin,
    "Ingrese Imax(A) de entrada:",iimax,
    "Ingrese Imax(A) de salida:",iiac}; 
  Object[] diseno = {
    "Ingrese Tmin ambiente(°C)",tmin,
    "Ingrese #.paneles por String:",ns,
    "Ingrese #.String en paralelo:",np,};

switch(paso){     
case 0:
  boton=0;
  image(redsolar,100,100);    //posicion de imagen(x,y)
  stroke(0);    //bordes negros
  fill(0,128,192); 
    rect(300,430,450,50,7);    //boton(x,y,an,al)
  
  fill(0);
  textFont(titulo,17);
    text("PANELES SOLARES                                              INVERSOR                                                         DISEÑO",85,390);
    text("PRESIONA AQUI PARA VERIFICAR TU DISEÑO",310,465);
  fill(176,0,0);
    text("INFORMACION:",450,530);
  textFont(normal,17);
    text("\nEl usuario debe tener el diseño basico de un sistema solar de conexion a la red, el software\n    solicitara unos datos de este diseño para verificar si esta bien planteado y poder seguir\n       con la aplicacion de las normativas, presiona el boton que se encuentra debajo de la\n               imagen del sistema solar de conexion a la red en esta ventana para continuar",160,530);  
    
    ppa=0;  voca=0;  isca=0;  Ba=0;
    ipa=0;  ivmaxa=0;  ivmina=0;  iimaxa=0;
    tmina=0;  nsa=0;  npa=0; iiaca=0;
    c=0;  c1=0;  c2=0;  c3=0;  c4=0;  c5=0;  c6=0;  c7=0;  c8=0;  
  paso=1;
break;

case 1:
  boton=0;
  if((mouseX>300)&&(mouseX<750)&&(mouseY>430)&&(mouseY<480)){
    boton=1;}
break;

case 2:   
  boton=0;
  JOptionPane.showMessageDialog(null,"INFORMACION PARA TENER EN CUENTA:\n> Utiliza el punto(.) como separador decimal\n> Digita los datos con las unidades establecidas");
    
   ppa=310;  voca=45.2;  isca=9.07;  Ba=-0.35;
   ipa=10;  ivmaxa=1000;  ivmina=200;  iimaxa=25;  iiaca=12;
//  tmina=15;  nsa=16;  npa=2;

/*int option=JOptionPane.showConfirmDialog(null, panel, "DATOS DEL PANEL", JOptionPane.OK_CANCEL_OPTION);
  if (option == JOptionPane.OK_OPTION){
    String a = pp.getText();
    String b = voc.getText();
    String c = isc.getText();
    String d = B.getText();

    ppa=Float.parseFloat(a);
    voca=Float.parseFloat(b);
    isca=Float.parseFloat(c);
    Ba=Float.parseFloat(d);
  }else{
    paso=0;  
    break;}

  int option1=JOptionPane.showConfirmDialog(null, inversor, "DATOS DEL INVERSOR", JOptionPane.OK_CANCEL_OPTION);
  if (option1 == JOptionPane.OK_OPTION){
    String e = ip.getText();
    String f = ivmax.getText();
    String g = ivmin.getText();
    String h = iimax.getText();
    String i = iiac.getText();
    
    ipa=Float.parseFloat(e);
    ivmaxa=Float.parseFloat(f);
    ivmina=Float.parseFloat(g);
    iimaxa=Float.parseFloat(h);
    iiaca=Float.parseFloat(i);
  }else{
    paso=0;  
    break;}
*/    
  int option2=JOptionPane.showConfirmDialog(null, diseno, "DATOS DE DISEÑO Y TEMPERATURA", JOptionPane.OK_CANCEL_OPTION);
  if (option2 == JOptionPane.OK_OPTION){
    String j = tmin.getText();
    String l = ns.getText();
    String m = np.getText();
   
    tmina=Float.parseFloat(j);
    nsa=Integer.parseInt(l);
    npa=Integer.parseInt(m);
  }else{
    paso=0;  
    break;}
    
  ppp=(ppa*nsa*npa)/1000;    //potencia calculada con series y paralelos
  voctmax=(1+(tmina-25)*(Ba/100))*voca;    //voltaje maximo en tmin
  voctmin=(1+(70-25)*(Ba/100))*voca;    //voltaje minimo a 70C
  nsmax=int(ivmaxa/voctmax);    //series maximas calculadas
  nsmin=int(ivmina/voctmin);    //series minimas calculadas    
  npmax=int(iimaxa/(isca*1.25));    //paralelos maximos calculados
  ipmin=ipa/1.25;
  ipmax=ipa*1.25;
  
  paso=3;  
break;

case 3:
  boton=0;
  stroke(224,224,224); //margen
  fill(224,224,224);
    rect(0,400,1050,250);
  fill(0);
  textFont(titulo,15);
    text("PANEL:                      INVERSOR:              DISEÑO:                   RANGOS CALCULADOS:",200,430);
  textFont(normal,15);
    text("\nP= "+int(ppa)+"(W)\nVoc= "+voca+"(V)\nIsc= "+isca+"(A)",200,430);
    text("\nP= "+int(ipa)+"(kW)\nVmax= "+int(ivmaxa)+"(V)\nVmin= "+int(ivmina)+"(V)\nImax= "+iimaxa+"(A)",350,430);
    text("\nP-pico= "+ppp+"(kW)\nNs: "+nsa+"\nNp: "+npa,500,430);
    text("\nP-pico= "+int(ipmin)+" a "+int(ipmax)+" (KW)\nNs= "+nsmin+" a "+nsmax+"\nNp<= "+npmax,650,430);
            
  if(ppp>ipmin && ppp<ipmax){
    fill(0);  
      text("\n\n>La potencia del panel por el numero de paneles se ajusta a la del inversor escogido",250,550);     
  }else{
    fill(176,0,0);  
      text("\n\n>La potencia del panel por el numero de paneles no se encuentra dentro del rango calculado",250,550);
  }
      
  if(nsa>nsmin && nsa<nsmax){
    fill(0);   
      text("\n\n\n>El # de paneles por String esta bien planteado con respecto al rango calculado(V.Inversor)",250,550); 
  }else{
    fill(176,0,0);
      text("\n\n\n>El # de paneles por String no se encuentra dentro del rango calculado(V.Inversor)",250,550); 
  }
      
  if(npa>=1 && npa<=npmax){
    fill(0);   
      text("\n\n\n\n>El # de String en paralelo esta bien plantedo con respecto al rango calculado(I.Inversor)",250,550);
  }else{
    fill(176,0,0);  
      text("\n\n\n\n>El # de String en paralelo no se encuentra dentro del rango calculado(I.Inversor)",250,550);
  }
  if(ppp>(ipa/1.20) && ppp<(ipa*1.20) && nsa>nsmin && nsa<nsmax && npa>=1 && npa<=npmax){
    image(bueno,150,530);    //posicion de imagen(x,y)
    fill(0); 
    textFont(titulo,15);
      text("DAR CLIC EN EL RECUADRO VERDE PARA APLICAR LAS NORMATIVAS.\nEL SISTEMA ESTA CORRECTAMENTE PLANTEADO:",250,550);
    ok=1;
  }else{
    image(malo,150,530);    //posicion de imagen(x,y)
    fill(176,0,0);
    textFont(titulo,15);
      text("DAR CLIC EN EL RECUADRO ROJO PARA REGRESAR.\nEL SISTEMA ESTA MAL PLANTEADO:",250,550);
    ok=2;
  }
  paso=4;
break;

case 4:
  boton=0;
  if((mouseX>150)&&(mouseX<250)&&(mouseY>530)&&(mouseY<630)&& ok==1){
    boton=2;}
      
  if((mouseX>150)&&(mouseX<250)&&(mouseY>530)&&(mouseY<630)&& ok==2){
    boton=3;}
break;

case 5:
  boton=0;
  image(red,100,120);    //posicion de imagen(x,y)
  stroke(0);    //bordes negros
  fill(255);
    rect(0,330,200,270);    //cuadro 1
    rect(150,330,150,270);    //cuadro 2
    rect(300,330,150,270);    //cuadro 3
    rect(450,330,150,270);    //cuadro 4
    rect(600,330,150,270);    //cuadro 5
    rect(750,330,150,270);    //cuadro 6
    rect(900,330,150,270);    //cuadro 7
    rect(750,500,300,100);    //cuadro gnd
  
  if(tmina>=20 && tmina<=24){
    t=1.02;}
  if(tmina>=15 && tmina<=19){
    t=1.04;}
  if(tmina>=10 && tmina<=14){
    t=1.06;}
  if(tmina>=5 && tmina<=9){
    t=1.08;}
  if(tmina>=0 && tmina<=4){
    t=1.1;}
  if(tmina>=-5 && tmina<=-1){
    t=1.12;}
  if(tmina>=-10 && tmina<=-6){
    t=1.14;}
  if(tmina>=-15 && tmina<=-11){
    t=1.16;}  
  if(tmina>=-20 && tmina<=-16){
    t=1.18;}
  if(tmina>=-25 && tmina<=-21){
    t=1.20;}
  if(tmina>=-30 && tmina<=-26){
    t=1.21;}
  if(tmina>=-35 && tmina<=-31){
    t=1.23;}
  if(tmina>=-40 && tmina<=-36){
    t=1.25;}
    
      
  vocmax=nsa*voca*t;
  is=1.25*isca*npa;    //corriente de 1
  ifdc=1.56*isca;    //coriente de 2
  iscmax=ifdc*npa;    //corriente de 3 y 4
  npaneles=npa*nsa;
  
  iis=1.25*iiaca;    //corriente de 6 y 7
         
  while(c<=11){
    awg1=idc[c]*0.58;
    if(awg1>=(ifdc)){
      c1=c;
      c=11;}
    c++;
  }
      
  while(c2<=11){
    awg1=idc[c2]*0.58;
    if(awg1>=iscmax){
      c3=c2;
      c2=11;}
    c2++;
  }
      
  while(c4<=11){
    awg1=idc[c4]*0.58*0.8;
    if(awg1>=iis){
      c5=c4;
      c4=11;}
    c4++;
  }
  
  while(c6<=11){    
    if(ignd[c6]>=iscmax){
      c7=c6;
      c6=11;}
    c6++;
  }
  
  if(awgdc[c3]>8){
  c8=6;
  }else{
  c8=c3+1;
  }
       
  fill(0);
  textFont(titulo,20);
    text("1                                                                   5",140,125);
    text("2                                    4                             6                           6",220,210);
    text(" 3                                                                7          ",320,160);
    text("            1                         2                          3                         4                          5                         6                         7 ",5,350);
  textFont(titulo,14);
    text("\n       SISTEMA DE\n          PANELES",5,350);      
    text("\n      CABLEADO DC\n CIRCUITO FUENTE",150,350);
    text("\n         COMBINER\n                BOX",300,350);
    text("\n CABLEADO OUT DC\n   COMBINER BOX",450,350);
    text("\n          INVERSOR\n    SELECCIONADO",600,350);
    text("\n      CABLEADO AC\n     OUT INVERSOR",750,350);
    text("\n           CAJA DE\n   PROTECCION AC",900,350);
    text("                     CONDUCTORES GND",750,520);
    
//1  
  textFont(normal,13);
    text("P-pico= "+nf(ppp,0,1)+"(kW)\nVocmax= "+nf(vocmax,0,1)+"(V)\nIscmax= "+nf(is,0,1)+"(A)\n#-paneles= "+npaneles+"\nNs= "+nsa+"\nNp= "+npa,10,410);
  textFont(titulo,13);     
    text("\n\n\n\n\n\n\nPanel Escogido",10,410);
  textFont(normal,13);
    text("\n\n\n\n\n\n\n\nP= "+ppa+"(W)\nVoc= "+voca+"(V)\nIsc= "+isca+"(A)",10,410);
//2
    text("Vdc= "+nf(vocmax,0,1)+"(V)\nI-string= "+nf(ifdc,0,1)+"(A)\nCalibre= "+awgdc[c1]+"(AWG)",160,410);
  textFont(titulo,13);     
    text("\n\n\n\nColor de\nConductores",160,410);
  textFont(normal,13);
    text("\n\n\n\n\n\n+= Rojo\n-= Azul\nGND= Verde/Amarillo",160,410);
//3
    text("Vdc= "+nf(vocmax,0,1)+"(V)\nEntradas= "+npa*2+"\nSalidas= 3",310,410);
  textFont(titulo,13);     
    text("\n\n\n\nProtecciones IN",310,410);
  textFont(normal,13);
    text("\n\n\n\n\nI-in= "+nf(ifdc,0,1)+"(A)\n#-Fusibles= "+npa*2,310,410);
  textFont(titulo,13);     
    text("\n\n\n\n\n\n\n\nProtecciones OUT",310,410); 
  textFont(normal,13);
    text("\n\n\n\n\n\n\n\n\nI-out= "+nf(iscmax,0,1)+"(A)\nDPS\nSeccionador",310,410);
//4
    text("Vdc= "+nf(vocmax,0,1)+"(V)\nI-paralelo= "+nf(iscmax,0,1)+"(A)\nCalibre= "+awgdc[c3]+"(AWG)",460,410);
  textFont(titulo,13);     
    text("\n\n\n\nColor de\nConductores",460,410);
  textFont(normal,13);
    text("\n\n\n\n\n\n+= Rojo\n-= Azul\nGND= Verde/Amarillo",460,410);
//5
    text("Pmax= "+nf(ipmax,0,1)+"(kW)\nPmin= "+nf(ipmin,0,1)+"(kW)",610,410);
  textFont(titulo,13);     
    text("\n\n\nDC",610,410);
  textFont(normal,13);
    text("\n\n\n\nVmax= "+nf(ivmaxa,0,0)+"(V)\nVmin= "+nf(ivmina,0,0)+"(V)\nImax= "+nf(iimaxa,0,1)+"(A)",610,410);
  textFont(titulo,13);     
    text("\n\n\n\n\n\n\n\nAC",610,410);
  textFont(normal,13);
    text("\n\n\n\n\n\n\n\n\nVout= Segun utilidad\nIout= "+nf(iiaca,0,1)+"(A)",610,410);
//6
    text("V= Segun utilidad\nImax= "+nf(iis,0,1)+"(A)\nCalibre= "+awgdc[c5]+"(AWG)",760,410);
//7
    text("V= Segun utilidad\nImax= "+nf(iis,0,1)+"(A)\nDisyuntor\nDPS\nSeccionador",910,410);  
//GND
  textFont(titulo,13);     
    text("\n\nElectrodo D.C",760,520);
  textFont(normal,13);   
    text("\n\n\nCalibre="+awgdc[c8]+"(AWG)",760,520); 
  textFont(titulo,13);     
    text("\n\nEquipos",910,520);  
  textFont(normal,13);   
    text("\n\n\nCalibre="+cgnd[c7]+"(AWG)",910,520);  
    
    
  image(info,125,331);    //1
  image(info,275,331);    //2
  image(info,425,331);    //3
  image(info,575,331);    //4
  image(info,725,331);    //5
  image(info,875,331);    //6
  image(info,1025,331);   //7
  image(info,1025,501);   //8
  image(volver,375,601);    //1
  paso=6;
break;

case 6:
  boton=0;
  if((mouseX>125)&&(mouseX<150)&&(mouseY>330)&&(mouseY<355)){
    boton=4;}
  if((mouseX>275)&&(mouseX<300)&&(mouseY>330)&&(mouseY<355)){
    boton=5;}
  if((mouseX>425)&&(mouseX<450)&&(mouseY>330)&&(mouseY<355)){
    boton=6;}
  if((mouseX>575)&&(mouseX<600)&&(mouseY>330)&&(mouseY<355)){
    boton=7;}
  if((mouseX>725)&&(mouseX<750)&&(mouseY>330)&&(mouseY<355)){
    boton=8;}
  if((mouseX>875)&&(mouseX<900)&&(mouseY>330)&&(mouseY<355)){
    boton=9;}
  if((mouseX>1025)&&(mouseX<1050)&&(mouseY>330)&&(mouseY<355)){
    boton=10;}
  if((mouseX>1025)&&(mouseX<1050)&&(mouseY>500)&&(mouseY<525)){
    boton=11;}  
  if((mouseX>375)&&(mouseX<675)&&(mouseY>600)&&(mouseY<650)){
    boton=12;}
break;
}}

void mousePressed(){
  if(boton==1){
    paso=2;}
    
  if(boton==2){
    fill(224,224,224);
      rect(0,100,1050,550);    //cuadro gris normativas
    ok=0;
    paso=5;}
    
  if(boton==3){
    stroke(224,224,224);
    fill(224,224,224);
      rect(0,400,1050,250);    //cuadro gris error
    ok=0;
    paso=0;}
      
  if(boton==4){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n690.7(A) Tensión máxima del sistema fotovoltaico.\n690.8(A)(1) Corrientes del circuito de la fuente fotovoltaica.\nETIQUETAS\n690.51 Los módulos deben estar marcados con la identificación de la polaridad\n              de puntas o terminales, la corriente nominal máxima del dispositivo de\n              protección contra sobrecorriente del módulo y los siguientes valores:\n              (1) Tensión de circuito abierto.\n              (2) Tensión de operación.\n              (3) Tensión máxima permisible del sistema.\n              (4) Corriente de funcionamiento.\n              (5) Corriente de cortocircuito.\n              (6) Potencia máxima. ","1. NORMATIVAS SISTEMA DE PANELES",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==5){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n690.8(B)(1) Dimensionamiento de los conductores y los dispositivos de protección contra sobrecorriente.\n690.31(A) Sistemas de alambrado.\n690.31(B) Cables de un solo conductor.\n310.15(B) La ampacidad de los conductores de 0 a 2000 voltios.\nTabla 310.16. Ampacidades permisibles en conductores aislados para tensiones nominales de 0 a 2000 voltios y 60°C a 90°C.","2. NORMATIVAS CABLEADO DE CIRCUITO FUENTE",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==6){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n690.7(A) Tensión máxima del sistema fotovoltaico\n690.8(B)(1) Dimensionamiento de los conductores y los dispositivos de protección contra sobrecorriente.\nRETIE:\n20.14 Dispositivos de protección contra sobretensiones transitorias(DPS)\nETIQUETAS\n690.17 Interruptor o interruptor automatico.\n                                          'ADVERTENCIA\n                        PELIGRO DE DESCARGA ELECTRICA.\n              NO TOCAR LOS TERMINALES.LOS TERMINALES,\n                TANTO EN EL LADO DE LA LINEA COMO EN EL\n                    DE CARGA, PUEDEN ESTAR ENERGIZADOS\n                              EN LA POSICION DE ABIERTO'","3. NORMATIVAS COMBINER BOX",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==7){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n690.8(A)(2) Corrientes del circuito fotovoltaico de salida.\n690.8(B)(1) Dimensionamiento de los conductores y los dispositivos de protección contra sobrecorriente.\n690.31(A) Sistemas de alambrado.\n690.31(B) Cables de un solo conductor.\n310.15(B) La ampacidad de los conductores de 0 a 2000 voltios.\nTabla 310.16. Ampacidades permisibles en conductores aislados para tensiones nominales de 0 a 2000 voltios y 60°C a 90°C.","4. NORMATIVAS CABLEADO OUT COMBINER BOX",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==8){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n705.14 características de la salida.\nETIQUETAS\n690.5(C) Etiquetados y marcados.\n                      'ADVERTENCIA\n    PELIGRO DE CHOQUE ELECTRICO\n   SI SE INDICA UNA FALLA A TIERRA,\n   LOS CONDUCTORES NORMALMENTE\n    PUESTOS A TIERRA PUEDEN ESTAR\nENERGIZADOS Y NO PUESTOS A TIERRA'","5. NORMATIVAS INVERSOR",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==9){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n690.8(A)(3) Corriente del circuito de salida del inversor.\n705.60(1) Dimensionamiento de los conductores y de los dispositivos de protección contra sobrecorriente.\n310.15(B) La ampacidad de los conductores de 0 a 2000 voltios.\nTabla 310.16. Ampacidades permisibles en conductores aislados para tensiones nominales de 0 a 2000 voltios y 60°C a 90°C.","6. NORMATIVAS CABLEADO OUT DEL INVERSOR",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==10){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\n690.54 Punto de interconexión del sistema interactivo.\n690.56(B) Instalaciones con sistemas fotovoltaicos y acometidas de la empresa de servicios públicos.\n705.12(D)(2) Valor nominal del conductor o de la barra conductora.\n705.60(1) Dimensionamiento de los conductores y de los dispositivos de protección contra sobrecorriente.\nRETIE\n20.14 Dispositivos de protección contra sobretensiones transitorias(DPS)\n20.16.1 Cortacircuitos para redes de distribución\nETIQUETAS\n690.54 Punto de interconexión del sistema interactivo. Todos los puntos de interconexión del sistema o sistemas\n              interactivos con otras fuentes deben marcarse en una ubicación accesible en el medio de desconexión\n              como una fuente de alimentación y con la corriente nominal de salida de c.a. y la tensión nominal de\n              funcionamiento de c.a. ","7. NORMATIVAS PROTECCIONES AC",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==11){
    JOptionPane.showMessageDialog(null,"NEC2014 Y NTC2050\nElectrodo D.C\n250.166(B) Calibre del conductor del electrodo de puesta a tierra de corriente continua no menor que el conductor más grande.\nEquipos\n690.45 Calibre del conductor de puesta a tierra de equipos.\nTabla 250.122. Calibre mínimo de conductores de puesta a tierra de equipos","NORMATIVAS CONDUCTORES GND",JOptionPane.INFORMATION_MESSAGE);
  }
  if(boton==12){
    stroke(224,224,224);
    fill(224,224,224);
      rect(0,100,1050,550);    //cuadro gris regreso
    paso=0;
  }
}
