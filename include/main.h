#include <Arduino.h>
#include <Stepper.h>

// #define DEBUG true
#ifdef DEBUG
#define DPRINT(...) Serial.print(__VA_ARGS__)
#define DPRINTLN(...) Serial.println(__VA_ARGS__)
#else
#define DPRINT(...)
#define DPRINTLN(...)
#endif

void menu();
void process(String string);
void move_to(float x, float y);
void draw_line(int x1, int y1, int x2, int y2);
void left();
void right();
void up();
void down();
void draw_arc_cw(float x, float y, float i, float j);
void draw_arc_ccw(float x, float y, float i, float j);
void pen_up();
void pen_down();
void abc();
void target();
void radials();
void steppersOff();