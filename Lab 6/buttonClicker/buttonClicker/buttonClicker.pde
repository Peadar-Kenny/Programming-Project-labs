ArrayList widgetList;
PFont stdFont;
color rectangleColour;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;
void setup(){
  color rectangleColour =  (0,0,0);
Widget widget1, widget2, widget3;
size(400, 400);
widget1=new Widget(100, 100, 100, 40,
"Green", color(100), 
EVENT_BUTTON1);
widget2=new Widget(100, 200, 100, 40,
"Red", color(150), EVENT_BUTTON2);
widget3 = new Widget(100, 300, 100,40, "Blue", color(200), EVENT_BUTTON3);
widgetList = new ArrayList();
widgetList.add(widget1); widgetList.add(widget2); widgetList.add(widget3);
}
void draw(){
  rect(50, 50, 50, 50);
  fill(rectangleColour);
for(int i = 0; i<widgetList.size(); i++){
Widget aWidget = (Widget) widgetList.get(i);
aWidget.draw();
}
}
void mousePressed(){
int event;
for(int i = 0; i<widgetList.size(); i++){
Widget aWidget = (Widget) widgetList.get(i);
event = aWidget.getEvent(mouseX,mouseY);
switch(event) {
case EVENT_BUTTON1:
println("button 1!");
break;
case EVENT_BUTTON2:
println("button 2!");
break;
}
}
}
